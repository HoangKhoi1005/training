void main() {
  /// Abstract final class mang đặc tính:
  /// - Không thể init/construct (khởi tạo) -> không có properties, functions
  /// - Không thể extends (kế thừa)
  /// - Không thể implements (hiện thực)
  /// => Phối hợp với static variables (const, final,...) để làm thành file
  ///  chứa các thuộc tính cấu hình để truy xuất toàn cục (global)
  ///
  final maxReload = GlobalConfiguration.maxReload;
  print('Max reload $maxReload');

  final defaultMinAge = GlobalConfiguration.defaultMinAge;
  print('Default min age $defaultMinAge');
  final defaultMaxAge = GlobalConfiguration.defaultMaxAge;
  print('Default max age $defaultMaxAge');

  /// Change global variable
  GlobalConfiguration.defaultMaxAge = 50;
  final changed = GlobalConfiguration.defaultMaxAge;
  print('Changed default max age $changed');
}

abstract final class GlobalConfiguration {
  /// Constant value - pre-compile -> không thể thay đổi
  static const maxReload = 3;

  /// Final value - không thể thay đổi
  static final defaultMinAge = 18;

  /// Variable value - có thể thay đổi
  static var defaultMaxAge = 65;
}
