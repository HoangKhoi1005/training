part of application;

class StoreCard extends StatelessWidget {
  final Store store;
  final String toolName;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const StoreCard({
    required this.store,
    required this.toolName,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  void onTap(BuildContext context) {
    final name = toolName.toLowerCase();
    if (name.contains('prix')) {
      StorePrixDetailRoute(
        storeId: store.storeId,
        toolName: toolName,
      ).push(context);
    } else if (name.contains('rupture')) {
      StoreRuptureDetailRoute(
        storeId: store.storeId,
        toolName: toolName,
      ).push(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Container(
        height: 104,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    store.logoPath,
                    width: 72,
                    height: 72,
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
                          style:
                              const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: CategoryHelper.backgroundColor(store.category),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      CategoryHelper.label(store.category),
                      style: TextStyle(
                        fontSize: 13,
                        color: CategoryHelper.textColor(store.category),
                      ),
                    ),
                  ),
                  Text(
                    store.name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(store.address, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.near_me,
                      size: 16,
                    ),
                    SizedBox(width: 3),
                    Text("${store.distanceKm.toStringAsFixed(2)} km",
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
                SizedBox(height: 26),
                GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
