void main() {
  /// Sự kiện ngắt cứng: mất điện, crash app, shutdown,...
  /// Sự kiện ngắt mềm: ERROR, EXCEPTION
  ///
  /// Error (lỗi): runtime error -> truy xuất biến không hợp lệ, code sai logic,..
  /// Exception (ngoại lệ): run-of-memory exception, 1 / NaN, 1/ Infinity,..
  ///
  /// compile -> framework -> SDK -> tools -> check regex format -> compile to binary code -> runnable file: exe | bin | ... d
  ///
  ///   --> Runtime error -> Lỗi xảy ra khi thực thi mã --> khi code thì tìm cách hạn chế nhất có thể -> kỹ năng của Devs
  ///
  /// Khi gặp sự cố:
  /// - Reproduce (tái hiện) được lỗi/sự cố: step A, step B
  /// - Điều kiện để xảy ra lỗi
  /// - Nguyên nhân gây ra lỗi
  /// - Giải pháp để xử lý lỗi:
  ///   + Giải pháp cấp bách mang tính tạm thời để giải quyết nhanh chóng vấn đề trước mắt
  ///   + Giải pháp triệt để cho vấn đề, thuờng tốn thời gian hơn.
  ///

  final a = 10;
  final b = 0;

  try {
    final result = divide(a, b);
    print('Result $result');
  } catch (e, s) {
    print(e);
    if (e is ArgumentError) {
      ///
    }
  }

  try {
    final result = divide(a, b);
    print('Result $result');
  } catch (e, s) {
    print(e);
    if (e is ArgumentError) {
      ///
    }
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
