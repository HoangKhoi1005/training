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

  try {
    final result = sendRequest();
    print('Result $result');
  } on TokenExpiredException catch (e, s) {
    /// Logout user
    print(e);
  } catch (e, s) {
    if (e is ArgumentError) {
      ///
    }
  }
}

Future sendRequest() async {
  throw TokenExpiredException();
}

/// Cách xử lý thông thường mọi người hay dùng: trả về object dữ liệu cho
/// hàm phía trước xử lý -> điều kiện tiên quyết là phải có hàm chờ sẵn và xử lý
/// Ví dụ:
/// dart```
/// final result = sendRequest();
/// if (result is TokenExpiredResult) {
///   logout();
/// }
/// ```
///
final class TokenExpiredResult {
  const TokenExpiredResult();
}

/// Cách chuyển logic thành sự kiện mềm để xử lý toàn cục
/// Ưu điểm: sự kiện toàn cục, nó sẽ throw đến khi gặp được nơi xử lý (try catch)
/// dù cho sự cố xảy ra ở bất kỳ dòng code nào
final class TokenExpiredException implements Exception {
  const TokenExpiredException();
}
