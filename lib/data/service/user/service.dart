part of my_data;

final class UserService {
  const UserService({
    required this.config,
  });

  final UserServiceConfig config;

  Future<UserServiceLoginDTO> login({
    required String userName,
    required String password,
  }) async {
    final host = config.host;
    final uri = Uri.parse(
      'https://$host/api/v1/saladin-user/public/login',
    );
    final requestData = {
      'phone': userName,
      'password': password,
    };
    final body = jsonEncode(requestData);
    final response = await http.post(uri, body: body);
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode <= 299) {
      // Success
      final responseBody = response.body;
      final json = jsonDecode(responseBody);
      if (json is Map<String, dynamic>) {
        final dto = UserServiceLoginDTO.fromJson(json);
        return dto;
      } else {
        throw RepositoryException(
          statusCode: -1,
          message: 'Dữ liệu không hợp lệ',
        );
      }
    } else {
      // Failed
      final reason = response.reasonPhrase;
      final message = reason ?? 'Đã có lỗi xảy ra';
      throw RepositoryException(
        statusCode: statusCode,
        message: message,
      );
    }
  }
}
