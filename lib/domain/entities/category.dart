class Category {
  final String name;
  final dynamic videoCount;

  Category({
    required this.name,
    required this.videoCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    return Category(
      name: json['name'], // Correspond à la clé JSON pour le nom
      videoCount: json[
          'videoCount'], // Correspond à la clé JSON pour le nombre de vidéos
    );
  }
}
