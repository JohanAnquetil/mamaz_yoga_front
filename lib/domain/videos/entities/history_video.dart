import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  final int id;
  final DateTime date;
  final int viewingTime;
  final int video;
  final int userId;

  const HistoryEntity({
    required this.id,
    required this.date,
    required this.viewingTime,
    required this.video,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        viewingTime,
        video,
        userId,
      ];
}
