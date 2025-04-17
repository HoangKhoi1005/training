part of application;

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AccountRoute>(
      path: 'account',
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final isLoggedIn = false; // Replace with your actual login check

    if (!isLoggedIn) {
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
