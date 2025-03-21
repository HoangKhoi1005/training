void main() {
  final choice = PurchaseKind.business;
  if (choice == PurchaseKind.nonBusiness) {
    ///
  } else {
    ///
  }

  /// Switch function
  switch (choice) {
    case PurchaseKind.business:

      ///
      break;
    case PurchaseKind.nonBusiness:

      ///
      break;
  }

  /// Switch type extension
  final title = switch (choice) {
    PurchaseKind.business => 'Kinh doanh',
    PurchaseKind.nonBusiness => 'Không kinh doanh',
  };
  print('Title $title');
  final propertyTitle = choice.title;
  print('propertyTitle $propertyTitle');

  int? value = 1;
  final kind = switch (value) {
    > 0 && < 10 => 'Small integer',
    < 100 => 'Great integer',
    int() => 'Other integer',
  };
  print('Kind of value $kind');
}

enum PurchaseKind {
  business,
  nonBusiness,
  ;

  String get title {
    return switch (this) {
      PurchaseKind.business => 'Kinh doanh',
      PurchaseKind.nonBusiness => 'Không kinh doanh',
    };
  }
}
