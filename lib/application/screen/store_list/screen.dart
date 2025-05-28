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
  List<Store> stores = [];
  Set<Store> favoriteStores = {};
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
      this.stores = stores;
      loading = false;
    });
  }

  void toggleFavorite(Store store) {
    setState(() {
      if (favoriteStores.contains(store)) {
        favoriteStores.remove(store);
      } else {
        favoriteStores.add(store);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      Tab(text: 'Favoris (${favoriteStores.length})'),
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
                        missionList(stores),
                        favoriteList(),
                      ],
                    ),
                  ),
                ],
              ));
  }

  Widget missionList(List<Store> stores) {
    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            StoreCard(
              store: stores[index],
              toolName: widget.toolName,
              isFavorite: favoriteStores.contains(stores[index]),
              onFavoriteToggle: () {
                toggleFavorite(stores[index]);
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

  Widget favoriteList() {
    return ListView.builder(
      itemCount: favoriteStores.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            StoreCard(
              store: favoriteStores.elementAt(index),
              toolName: widget.toolName,
              isFavorite: favoriteStores.contains(favoriteStores.elementAt(index)),
              onFavoriteToggle: () {
                toggleFavorite(favoriteStores.elementAt(index),);
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
