part of application;

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final manager = ApplicationManager();
    final isValidToken = manager.isValidToken;
    if (isValidToken) {
      final location = HomeRoute().location;
      return location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgot-password',
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordScreen();
  }
}

@TypedGoRoute<SignUpRoute>(
  path: '/sign-up',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute({
    this.firstName,
    this.lastName,
    this.email,
  });

  final String? firstName;
  final String? lastName;
  final String? email;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpScreen(
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
