part of application;

class StorePrixDetail extends StatefulWidget {
  final Store? store;
  final int storeId;
  final String toolName;

  const StorePrixDetail(
      {super.key, required this.storeId, required this.toolName})
      : store = null;

  StorePrixDetail.store(
      {super.key, required Store this.store, required this.toolName})
      : storeId = store.storeId;

  @override
  State<StorePrixDetail> createState() => _StorePrixDetailState();
}

class _StorePrixDetailState extends State<StorePrixDetail>
    with TickerProviderStateMixin {
  late final GetStoresUseCase getStoresUseCase;
  late final GetMissionsUseCase getMissionsUseCase;
  late Store store;
  // bool loading = true;
  late final TabController _tabController;
  List<Mission> missions = [];
  late final ApplicationManager applicationManager;
  late final Future<Map<String, dynamic>> _detailsFuture;


  @override
  void initState() {
    super.initState();
    applicationManager = ApplicationManager();
    _tabController = TabController(length: 3, vsync: this);
    getStoresUseCase = GetStoresUseCase(storeRepository: StoreRepositoryImpl());
    getMissionsUseCase =
        GetMissionsUseCase(missionRepository: MissionRepositoryImpl());
    _detailsFuture = _loadStoreDetailsAsync();
  }

  // Future<void> loadStore() async {
  //   final store =
  //       widget.store ?? await getStoresUseCase.getStoreById(widget.storeId);
  //   final missions = await getMissionsUseCase.call(store.name, widget.toolName);
  //   setState(() {
  //     this.store = store;
  //     this.missions = missions;
  //     loading = false;
  //   });
  // }

    Future<Map<String, dynamic>> _loadStoreDetailsAsync() async {
    try {
      final storeData = widget.store ??
          await getStoresUseCase.getStoreById(widget.storeId);
      final missionsData =
          await getMissionsUseCase.call(storeData.name, widget.toolName);
      return {
        'store': storeData,
        'missions': missionsData,
      };
    } catch (e) {
      print("Error loading store details in _loadStoreDetailsAsync: $e");
      rethrow;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void toggleFavorite(Store store) {
  //   final isFavorite = store.isFavorite;
  //   final changedStore = store.copyWith(isFavorite: !isFavorite);
  //   setState(() {
  //     this.store = changedStore;
  //   });
  // }

  void toggleFavorite(Store store) {
    applicationManager.toggleStoreFavorite(store.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _detailsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(title: const Text('Lỗi')),
              body: Center(
                  child: Text('Lỗi tải chi tiết cửa hàng: ${snapshot.error}', textAlign: TextAlign.center,)));
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(
              appBar: AppBar(title: const Text('Không có dữ liệu')),
              body: const Center(child: Text('Không tìm thấy chi tiết cửa hàng.')));
        }

        final Map<String, dynamic> detailsMap = snapshot.data!;
        final Store store = detailsMap['store'] as Store;
        final List<Mission> missions = detailsMap['missions'] as List<Mission>;

        return ListenableBuilder(
        listenable: applicationManager,
        builder: (context, _) {
          final isFavorite = applicationManager.isStoreFavorite(store.storeId);
          return Scaffold(
            appBar: AppBar(
              title: Text(''),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    toggleFavorite(store);
                    final snackBar = SnackBar(
                      content: Text(
                        isFavorite
                            ? 'Ajouté aux favoris'
                            : 'Retiré des favoris',
                      ),
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(140),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 29, right: 17, top: 8, bottom: 34),
                  child: ColoredBox(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Badge(
                          label: store.notificationCount <= 0
                              ? null
                              : Text(
                                  '${store.notificationCount}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              store.logoPath,
                              width: 96,
                              height: 96,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${store.name} Voltaire",
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              Text("39 Boulvard Voltaire",
                                  style: const TextStyle(fontSize: 16)),
                              Text("${store.address}",
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 32,
                          width: 358,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: false,
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
                              Tab(text: 'Disponibles'),
                              Tab(text: 'En cours'),
                              Tab(text: 'Expirée'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Center(child: Text('Missions Disponibles')),
                              Center(child: missionCardList(missions)),
                              Center(child: Text('Missions Expirée')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      );
      },
    );
  }

  Widget missionCardList(List<Mission> missions) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "Mission(s) en cours",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: missions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MissionCard(mission: missions[index]),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
