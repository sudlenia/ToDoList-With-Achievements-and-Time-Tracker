import 'package:drift/drift.dart';

class CompletedAchievementItems extends Table {
  IntColumn get userId => integer()();
  IntColumn get achievementId => integer()();
}
