import 'package:flutter_application_2/data/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    int? id,
    required String name,
    required String description
  }) = _Achievement;

  factory Achievement.fromDatabase(AchievementItem item) => Achievement(
        id: item.id,
        name: item.name,
        description: item.description,
      );
}
