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
        $extra: store,
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
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      leading: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              store.logoPath,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 72,
                  height: 72,
                  color: Colors.grey[300],
                  child: Icon(Icons.store, color: Colors.grey[600]),
                );
              },
            ),
          ),
          if (store.notificationCount > 0)
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${store.notificationCount}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: CategoryHelper.backgroundColor(store.category),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              CategoryHelper.label(store.category),
              style: TextStyle(
                fontSize: 12,
                color: CategoryHelper.textColor(store.category),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            store.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: Text(
          store.address,
          style: TextStyle(fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.near_me,
                size: 14,
                color: Colors.grey[600],
              ),
              SizedBox(width: 2),
              Text(
                "${store.distanceKm.toStringAsFixed(1)} km",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: onFavoriteToggle,
            customBorder: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.purple,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        onTap(context);
      },
    );
  }
}
