import 'package:drift/drift.dart';

class ProgressOfAchievementItems extends Table {
  IntColumn get userId => integer()();
  IntColumn get progressAchievement1 => integer()();
  IntColumn get progressAchievement2 => integer()();
  IntColumn get progressAchievement3 => integer()();
}
