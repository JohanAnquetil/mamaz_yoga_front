import 'package:equatable/equatable.dart';

class CategoryVideoEntity extends Equatable {
  final int id;
  final String category;

  const CategoryVideoEntity({
    required this.id,
    required this.category,
  });

  static CategoryVideoEntity emptyCategory() =>
      CategoryVideoEntity(id: 0, category: '');

  @override
  List<Object?> get props => [
        id,
        category,
      ];

  @override
  String toString() {
    return "id: $id, category: $category";
  }
}
