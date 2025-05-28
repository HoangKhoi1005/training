part of application;

class MissionCard extends StatelessWidget {
  final Mission mission;

  const MissionCard({super.key, required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Nom de la mission',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.circle, size: 10, color: Color(0xFFED6C2C)),
              const SizedBox(width: 6),
              Text(
                mission.name,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                'Créée le ${mission.createdAt}',
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.hourglass_bottom, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                'Se termine le ${mission.endAt}',
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
