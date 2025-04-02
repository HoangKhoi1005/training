import 'data/data.dart';
import 'domain/domain.dart';

void main() async {
  final userService = UserService(config: DevUserServiceConfig());

  try {
    final loginDTO = await userService.login(
      userName: '0936688749',
      password: '123123',
    );

    final user = loginDTO.user;
    print('ID: ${user.id}');
    print('Tên người dùng: ${user.name}');
    print('Email: ${user.email}');
    print('Số điện thoại: ${user.phone}');
    print('Mã giới thiệu: ${user.referralCode}');
  } catch (e) {
    if (e is RepositoryException) {
      print('Đăng nhập thất bại: ${e.message} (Status code: ${e.statusCode})');
    } else {
      print('Đăng nhập thất bại: $e');
    }
  }
}