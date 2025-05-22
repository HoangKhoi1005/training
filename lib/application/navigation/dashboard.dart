part of application;

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AccountRoute>(
      path: 'account',
    ),
    TypedGoRoute<StoreListRoute>(
      path: 'tools/:toolName',
    )
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final manager = ApplicationManager();
    final isValidToken = manager.isValidToken;

    if (!isValidToken) {
      final location = LoginRoute().location;
      return location;
    }

    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class AccountRoute extends GoRouteData {
  const AccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountScreen();
  }
}

class StoreListRoute extends GoRouteData {
  final String toolName;

  const StoreListRoute({required this.toolName});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return StoreListScreen(toolName: toolName);
  }
}
