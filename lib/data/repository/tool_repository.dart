part of my_data;

final class ToolRepositoryImpl implements ToolRepository {
  @override
  Future<List<Tool>> getTools() async {
    await Future.delayed(Duration(milliseconds: 500));
    return const [
      Tool(title: "Prix", iconPath: "assets/images/prix_icon.png"),
      Tool(title: "Reportage", iconPath: "assets/images/reportage_icon.png"),
      Tool(title: "Rupture", iconPath: "assets/images/rupture_icon.png"),
      Tool(title: "HQSE", iconPath: "assets/images/hqse_icon.png"),
    ];
  }
}