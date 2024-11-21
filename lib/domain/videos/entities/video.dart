import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String name;
  final String category;
  final String formattedDuration;

  const VideoEntity({
    required this.name,
    required this.category,
    required this.formattedDuration,
  });

  @override
  List<Object?> get props => [name, category, formattedDuration];
}
