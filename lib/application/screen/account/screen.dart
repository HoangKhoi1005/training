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
          onPressed: () async {
            void goToLogin() {
              final route = LoginRoute();
              route.go(context);
            }

            final manager = ApplicationManager();
            await manager.logout();
            goToLogin();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
