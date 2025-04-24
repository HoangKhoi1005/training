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
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: manager,
          builder: (context, child) {
            final user = manager.user;
            return Text('Xin chào ${user?.fullName ?? 'bạn'}');
          },
        ),
      ),
      body: Placeholder(),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(16),
        child: ValueListenableBuilder(
          valueListenable: manager.favoriteButtonNotifier,
          builder: (context, value, child) {
            final isFavorite = value;
            void onPressed() {
              // final router = GoRouter.of(context);
              // final location = '/account';
              // router.push(location);

              manager.favoriteButtonNotifier.value = !isFavorite;
            }

            if (isFavorite) {
              return OutlinedButton(
                onPressed: onPressed,
                child: Text('Unmark'),
              );
            }
            return ElevatedButton(
              onPressed: onPressed,
              child: Text('Mark as Favorite'),
            );
          },
        ),
      ),
    );
  }
}
