import '../../../domain/videos/entities/history_video.dart';

class HistoryModel {
  final int id;
  final DateTime date;
  final int viewingTime;
  final int video;
  final int userId;

  const HistoryModel({
    required this.id,
    required this.date,
    required this.viewingTime,
    required this.video,
    required this.userId,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      viewingTime: int.parse(json['viewingTime']),
      video: json['video']['id'],
      userId: json['user']['id'],
    );
  }
}

extension HistoryXModel on HistoryModel {
  HistoryEntity toEntity() {
    return HistoryEntity(
      id: id,
      date: date,
      viewingTime: viewingTime,
      video: video,
      userId: userId,
    );
  }
}
