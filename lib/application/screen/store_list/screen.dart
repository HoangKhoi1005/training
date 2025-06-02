part of application;

class StoreListScreen extends StatefulWidget {
  final String toolName;

  const StoreListScreen({super.key, required this.toolName});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen>
    with TickerProviderStateMixin {
  late final GetStoresUseCase getStoresUseCase;
  final List<Store> stores = [];
  bool loading = true;
  late final TabController _tabController;
  late final ApplicationManager _applicationManager;
  late Future<List<Store>> _storesFuture;

  @override
  void initState() {
    super.initState();
    _applicationManager = ApplicationManager();
    _tabController = TabController(length: 2, vsync: this);
    getStoresUseCase = GetStoresUseCase(storeRepository: StoreRepositoryImpl());
    _storesFuture = _loadStoresAsync();
  }

    Future<List<Store>> _loadStoresAsync() async {
    try {
      return await getStoresUseCase.call(widget.toolName);
    } catch (e) {
      // FutureBuilder sẽ bắt lỗi này qua snapshot.hasError
      print("Error loading stores in _loadStoresAsync: $e");
      rethrow; // Ném lại lỗi để FutureBuilder xử lý
    }
  }

  // Future<void> loadStores() async {
  //   final stores = await getStoresUseCase.call(widget.toolName);
  //   setState(() {
  //     this.stores.clear();
  //     this.stores.addAll(stores);
  //     loading = false;
  //   });
  // }

  // void toggleFavorite(Store store) {
  //   final isFavorite = store.isFavorite;
  //   final changedStore = store.copyWith(isFavorite: !isFavorite);
  //   setState(() {
  //     int index = stores.indexWhere((s) => s.storeId == store.storeId);
  //     if (index >= 0) {
  //       stores.removeAt(index);
  //     } else {
  //       index = stores.length;
  //     }
  //     stores.insert(index, changedStore);
  //   });
  // }

  void toggleFavorite(Store store) {
    _applicationManager.toggleStoreFavorite(store.storeId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Store>>(
      future: _storesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Une erreur s\'est produite')),
          );
        }

        final allStores = snapshot.data ?? [];

        return ListenableBuilder(
          listenable: _applicationManager,
          builder: (context, _) {
            final favoriteStores = _applicationManager.getFavoriteStores(allStores);

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: Container(
                        height: 32,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Missions (${allStores.length})'),
                            Tab(text: 'Favoris (${favoriteStores.length})'),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, // TODO: implement search
                      icon: Icon(Icons.search, color: Theme.of(context).primaryColor, size: 32),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  const SizedBox(height: 14),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Outil ${widget.toolName}',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _StoreListView(
                          toolName: widget.toolName,
                          items: allStores,
                          toggleFavorite: toggleFavorite,
                          isFavorite: false,
                          applicationManager: _applicationManager,
                        ),
                        _StoreListView(
                          toolName: widget.toolName,
                          items: allStores,
                          toggleFavorite: toggleFavorite,
                          isFavorite: true,
                          applicationManager: _applicationManager,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _StoreListView extends StatelessWidget {
  const _StoreListView(
      {super.key,
      required this.toolName,
      required this.items,
      required this.toggleFavorite,
      this.isFavorite = false,
      required this.applicationManager});

  final String toolName;

  final List<Store> items;

  final void Function(Store) toggleFavorite;

  final bool isFavorite;

  final ApplicationManager applicationManager;

  @override
  Widget build(BuildContext context) {
    var items = List<Store>.from(this.items);
    if (isFavorite == true) {
      items = items
          .where((store) => applicationManager.isStoreFavorite(store.storeId))
          .toList();
    }
    final itemCount = items.length;
    if (items.isEmpty) {
      return Center(
        child: Text(
          'Aucun élément trouvé',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index >= itemCount) {
          print('Current index $index');
          return null;
        }
        final item = items.elementAt(index);
        final isFavorite = applicationManager.isStoreFavorite(item.storeId);
        return Column(
          children: [
            StoreCard(
              store: item,
              toolName: toolName,
              isFavorite: isFavorite,
              onFavoriteToggle: () {
                toggleFavorite(item);
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
