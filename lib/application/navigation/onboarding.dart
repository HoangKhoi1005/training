part of application;

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

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
