part of application;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GetToolsUseCase getToolsUseCase;
  List<Tool> tools = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getToolsUseCase = GetToolsUseCase(toolRepository: ToolRepositoryImpl());
    loadTools();
  }

  Future<void> loadTools() async {
    final tools = await getToolsUseCase.call();
    setState(() {
      this.tools = tools;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud_upload),
                label: 'Envoi de données',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 69),
                  Text("Ma boite à outils",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Mes outils disponibles à date",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      childAspectRatio: 169 / 114,
                      children:
                          tools.map((tool) => ToolCard(tool: tool)).toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final manager = ApplicationManager();
//     return Scaffold(
//       appBar: AppBar(
//         title: ListenableBuilder(
//           listenable: manager,
//           builder: (context, child) {
//             final user = manager.user;
//             return Text('Xin chào ${user?.fullName ?? 'bạn'}');
//           },
//         ),
//       ),
//       body: Placeholder(),
//       bottomNavigationBar: SafeArea(
//         minimum: EdgeInsets.all(16),
//         child: ValueListenableBuilder(
//           valueListenable: manager.favoriteButtonNotifier,
//           builder: (context, value, child) {
//             final isFavorite = value;
//             void onPressed() {
//               // final router = GoRouter.of(context);
//               // final location = '/account';
//               // router.push(location);
//
//               manager.favoriteButtonNotifier.value = !isFavorite;
//             }
//
//             if (isFavorite) {
//               return OutlinedButton(
//                 onPressed: onPressed,
//                 child: Text('Unmark'),
//               );
//             }
//             return ElevatedButton(
//               onPressed: onPressed,
//               child: Text('Mark as Favorite'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
