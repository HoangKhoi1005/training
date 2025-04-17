part of application;

final $router = GoRouter(
  initialLocation: '/',
  // routes: [
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) {
  //       return LoginScreen();
  //     },
  //     routes: [
  //       ///
  //     ],
  //   ),
  //   GoRoute(
  //     path: '/home',
  //     builder: (context, state) {
  //       return HomeScreen();
  //     },
  //     routes: [
  //       ///
  //     ],
  //   ),
  //   GoRoute(
  //     path: '/account',
  //     builder: (context, state) {
  //       return AccountScreen();
  //     },
  //     routes: [
  //       GoRoute(
  //         path: 'detail',
  //         builder: (context, state) {
  //           return AccountScreen();
  //         },
  //         routes: [
  //           ///
  //         ],
  //       ),
  //     ],
  //   ),
  //   GoRoute(
  //     path: '/forgot-password',
  //     builder: (context, state) {
  //       return ForgotPasswordScreen();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/sign-up',
  //     builder: (context, state) {
  //       final uri = state.uri;
  //       final email = uri.queryParameters['email'];
  //       return SignUpScreen();
  //     },
  //   ),
  //
  //   ///
  // ],
  routes: $appRoutes,
);
