part of my_domain;

interface class Tool {
  final String title;
  final String iconPath;

  const Tool({
    required this.title,
    required this.iconPath,
  });

  Tool copyWith({
    String? title,
    String? iconPath,
  }) {
    return Tool(
      title: title ?? this.title,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconPath': iconPath,
    };
  }

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      title: json['title'] as String,
      iconPath: json['iconPath'] as String,
    );
  }
}