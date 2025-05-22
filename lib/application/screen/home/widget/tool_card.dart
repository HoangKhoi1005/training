part of application;

class ToolCard extends StatelessWidget {
  final Tool tool;

  const ToolCard({required this.tool});

  void onTap(BuildContext context) {
    final route = StoreListRoute(toolName: tool.title);
    route.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                tool.iconPath,
                width: 56,
                height: 56,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 8),
              Text(
                tool.title,
                style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
