import 'package:mamaz_yoga/domain/videos/entities/category_video.dart';

class CategoryVideoModel {
  final int categoryId;
  final String categoryName;

  const CategoryVideoModel({
    required this.categoryId,
    required this.categoryName,
  });

  factory CategoryVideoModel.fromJson(Map<String, dynamic> json) {
    print("FromJson: ${json['id']} ${json['category']}");
    print("fromJson: $json");
    return CategoryVideoModel(
      categoryId: json['id'] as int,
      categoryName: json['category'] as String,
    );
  }
}

extension CategoryVideoModelXEntity on CategoryVideoModel {
  CategoryVideoEntity categoryToEntity() {
    print("in category model to entity");
    print(categoryId);
    print(categoryName);
    return CategoryVideoEntity(
      id: categoryId,
      category: categoryName,
    );
  }
}
