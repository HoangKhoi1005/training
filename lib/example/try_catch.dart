void main() {
  /// Sự kiện ngắt cứng: mất điện, crash app, shutdown,...
  /// Sự kiện ngắt mềm: ERROR, EXCEPTION
  ///
  /// Error (lỗi): runtime error -> truy xuất biến không hợp lệ, code sai logic,..
  /// Exception (ngoại lệ): run-of-memory exception, 1 / NaN, 1/ Infinity,..
  final a = 10;
  final b = 0;

  try {
    final result = divide(a, b);
    print('Result $result');
  } catch (e, s) {
    print(e);
    if (e is ArgumentError) {
      /// Show dialog....
    }
  }


  try {
    final result = divide(a, b);
    print('Result $result');
  } on ArgumentError catch (e, s) {
    print(e);
    if (e is ArgumentError) {
      /// Show dialog....
    }
  }




  try {
    /// Show loading
    final result = divide(a, b);
    print('Result $result');
  } finally {
    /// Hide loading
  }

  try {
    /// Show loading
    final result = divide(a, b);
    print('Result $result');
  } on ArgumentError catch (e, s) {
    /// Hide loading
    /// Show error message dialog
  } catch (e, s) {
    /// Hide loading
    print(e);
    print(s);
  }
}


num divide(num a, num b) {
  if (a == 0) {
    return 0;
  }
  if (b == 0) {
    throw ArgumentError('Invalid value b: $b');
  }
  return a / b;
}