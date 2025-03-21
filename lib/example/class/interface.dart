///
/// INTERFACE
/// Internal: có thể extends hoặc implements
/// ExternalL chỉ có thể implements

abstract interface class CarBrand {
  const CarBrand();

  /// Không nên có variables, chỉ nên có GET properties
  String get name;

  /// Không nên viết sẵn function cho interface
  String sound() {
    return '!!!!';
  }
}

class KIA implements CarBrand {
  const KIA();

  @override
  String get name => throw UnimplementedError();

  @override
  String sound() {
    /// Phải viết lại từ đầu mặc dù CarBrand đã có !!!
    // TODO: implement sound
    throw UnimplementedError();
  }
}
