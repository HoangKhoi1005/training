part of application;

class CategoryHelper {
  static String label(StoreCategory category) {
    switch (category) {
      case StoreCategory.supermarche:
        return 'Supermarché';
      case StoreCategory.hypermarche:
        return 'Hypermarché';
      case StoreCategory.superette:
        return 'Superette';
      }
  }

  static Color backgroundColor(StoreCategory category) {
    switch (category) {
      case StoreCategory.supermarche:
        return const Color(0x263DC2FF);
      case StoreCategory.hypermarche:
        return const Color(0x266C7AFB);
      case StoreCategory.superette:
        return const Color(0x262FD36F);
      }
  }

  static Color textColor(StoreCategory category) {
    switch (category) {
      case StoreCategory.supermarche:
        return const Color(0xFF3DC2FF);
      case StoreCategory.hypermarche:
        return const Color(0xFF6C7AFB);
      case StoreCategory.superette:
        return const Color(0xFF2FD36F);
      }
  }
}