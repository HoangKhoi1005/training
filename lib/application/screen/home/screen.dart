part of application;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = ApplicationManager();
    final user = manager.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Xin chào ${user?.fullName ?? 'bạn'}'),
      ),
      body: Placeholder(),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final router = GoRouter.of(context);
            final location = '/account';
            router.push(location);
          },
          child: Text('Go to account'),
        ),
      ),
    );
  }
}
