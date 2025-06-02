part of application;

class StoreRuptureDetail extends StatefulWidget {
  final int storeId;
  final String toolName;

  const StoreRuptureDetail(
      {super.key, required this.storeId, required this.toolName});

  @override
  State<StoreRuptureDetail> createState() => _StoreRuptureDetailState();
}

class _StoreRuptureDetailState extends State<StoreRuptureDetail> {
  late final GetStoresUseCase getStoresUseCase;

  late final Store store;
  bool loading = true;
  late final ApplicationManager _applicationManager;
  late Future<Store> _storesFuture;

  @override
  void initState() {
    super.initState();
    _applicationManager = ApplicationManager();
    getStoresUseCase = GetStoresUseCase(storeRepository: StoreRepositoryImpl());
    _storesFuture = _loadStoresAsync();
  }

  // Future<void> loadStore() async {
  //   final store = await getStoresUseCase.getStoreById(widget.storeId);
  //   setState(() {
  //     this.store = store;
  //     loading = false;
  //   });
  // }

  Future<Store> _loadStoresAsync() async {
    try {
      return await getStoresUseCase.getStoreById(widget.storeId);
    } catch (e) {
      // FutureBuilder sẽ bắt lỗi này qua snapshot.hasError
      print("Error loading stores in _loadStoresAsync: $e");
      rethrow; // Ném lại lỗi để FutureBuilder xử lý
    }
  }

  void toggleFavorite(Store store) {
    _applicationManager.toggleStoreFavorite(store.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _storesFuture,
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
                  child: Text(
                'Lỗi tải chi tiết cửa hàng: ${snapshot.error}',
                textAlign: TextAlign.center,
              )));
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(
              appBar: AppBar(title: const Text('Không có dữ liệu')),
              body: const Center(
                  child: Text('Không tìm thấy chi tiết cửa hàng.')));
        }

        store = snapshot.data!;

        return ListenableBuilder(
            listenable: _applicationManager,
            builder: (context, _) {
              final isFavorite =
                  _applicationManager.isStoreFavorite(store.storeId);
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
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    store.logoPath,
                                    width: 96,
                                    height: 96,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (store.notificationCount > 0)
                                  Positioned(
                                    right: -4,
                                    top: -4,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '${store.notificationCount}',
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
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
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Détails de la rupture',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Outil utilisé : ${widget.toolName}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      // Add more details about the rupture here
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
