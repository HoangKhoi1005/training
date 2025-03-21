///
/// BASE
/// Internal: có thể extends hoặc implements
/// ExternalL chỉ có thể extends
///
/// https://dart.dev/language/class-modifiers

abstract base class CarBrand {
  const CarBrand();

  /// Không giới hạn việc có variables hay GET properties
  String get name;

  /// NÊN viết sẵn function cho base để dùng chung
  String sound() {
    return '!!!!';
  }
}

base class KIA extends CarBrand {
  const KIA();

  @override
  String get name => throw UnimplementedError();
}
