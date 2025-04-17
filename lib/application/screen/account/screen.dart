part of application;

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Placeholder(),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // final router = GoRouter.of(context);
            // final location = '/';
            // router.push(location);
            const route = HomeRoute();
            route.push(context);
          },
          child: Text('Go to Home'),
        ),
      ),
    );
  }
}
