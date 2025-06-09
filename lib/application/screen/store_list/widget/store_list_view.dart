part of application;

class StoreListView extends StatelessWidget {
  const StoreListView(
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
