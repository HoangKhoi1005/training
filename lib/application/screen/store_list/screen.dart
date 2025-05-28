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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getStoresUseCase = GetStoresUseCase(storeRepository: StoreRepositoryImpl());
    loadStores();
  }

  Future<void> loadStores() async {
    final stores = await getStoresUseCase.call(widget.toolName);
    setState(() {
      this.stores.clear();
      this.stores.addAll(stores);
      loading = false;
    });
  }

  void toggleFavorite(Store store) {
    final isFavorite = store.isFavorite;
    final changedStore = store.copyWith(isFavorite: !isFavorite);
    setState(() {
      int index = stores.indexWhere((s) => s.storeId == store.storeId);
      if (index >= 0) {
        stores.removeAt(index);
      } else {
        index = stores.length;
      }
      stores.insert(index, changedStore);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toolName = widget.toolName;
    final favoriteCount = stores.where((s) => s.isFavorite).length;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Container(
                  height: 32,
                  width: 268,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F0F0),
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
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Missions (${stores.length})'),
                      Tab(text: 'Favoris ($favoriteCount)'),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(height: 14),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Outil ${widget.toolName}',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _StoreListView(
                          toolName: toolName,
                          items: stores,
                          toggleFavorite: toggleFavorite,
                        ),
                        _StoreListView(
                          toolName: toolName,
                          items: stores,
                          toggleFavorite: toggleFavorite,
                          isFavorite: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}

class _StoreListView extends StatelessWidget {
  const _StoreListView(
      {super.key,
      required this.toolName,
      required this.items,
      required this.toggleFavorite,
      this.isFavorite = false});

  final String toolName;

  final List<Store> items;

  final void Function(Store) toggleFavorite;

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final items = List<Store>.from(this.items);
    if (isFavorite == true) {
      items.removeWhere((element) => !element.isFavorite);
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
        final isFavorite = item.isFavorite;
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
