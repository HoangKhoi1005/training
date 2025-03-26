part of my_data;

abstract class UserServiceConfig {
  const UserServiceConfig();

  String get host;
}

final class DevUserServiceConfig implements UserServiceConfig {
  const DevUserServiceConfig();

  @override
  final String host = 'gw-dev.saladin.vn';
}

final class ProductionUserServiceConfig implements UserServiceConfig {
  const ProductionUserServiceConfig();

  @override
  final String host = 'gw.saladin.vn';
}
