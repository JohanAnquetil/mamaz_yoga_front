class Video {
  final String name;
  final String category;
  final String formattedDuration;

  Video({
    required this.name,
    required this.category,
    required this.formattedDuration,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      category: json['category'],
      formattedDuration: json['formattedDuration'],
    );
  }
}
