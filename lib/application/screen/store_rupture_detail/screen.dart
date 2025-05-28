part of application;

class StoreRuptureDetail extends StatefulWidget {
  final int storeId;
  final String toolName;

  const StoreRuptureDetail({super.key, required this.storeId, required this.toolName});

  @override
  State<StoreRuptureDetail> createState() => _StoreRuptureDetailState();
}

class _StoreRuptureDetailState extends State<StoreRuptureDetail> {
  late final GetStoresUseCase getStoresUseCase;

  late final Store store;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getStoresUseCase = GetStoresUseCase(storeRepository: StoreRepositoryImpl());
    loadStore();
  }

  Future<void> loadStore() async {
    final store = await getStoresUseCase.getStoreById(widget.storeId);
    setState(() {
      this.store = store;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
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
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Padding(
            padding:
            const EdgeInsets.only(left: 29, right: 17, top: 8, bottom: 34),
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
                                    fontSize: 10, color: Colors.white),
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
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Détails de la rupture',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
  }
}
