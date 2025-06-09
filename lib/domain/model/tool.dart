part of my_domain;

@freezed
interface class Tool with _$Tool {
  @override
  final String title;

  @override
  final String iconPath;

  const Tool({
    required this.title,
    required this.iconPath,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      title: json['title'] as String,
      iconPath: json['iconPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconPath': iconPath,
    };
  }
}
