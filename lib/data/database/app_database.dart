import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_application_2/data/database/achievement_table.dart';
import 'package:flutter_application_2/data/database/category_table.dart';
import 'package:flutter_application_2/data/database/completed_achievement_table.dart';
import 'package:flutter_application_2/data/database/progress_of_achievement_table.dart';
import 'package:flutter_application_2/data/database/task_table.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  TaskItems,
  CategoryItems,
  AchievementItems,
  ProgressOfAchievementItems,
  CompletedAchievementItems
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //   onCreate: (Migrator m) async {
  //     await m.createAll();
  //   },
  //   onUpgrade: (Migrator m, int from, int to) async {
  //     if (from == 1) {
  //     }
  //   },
  // );

  //
  //
  // Task
  //
  //

  Future<List<TaskItem>> getAllTasks() async {
    final query = select(taskItems)
      ..orderBy([
        (t) => OrderingTerm(expression: t.isDone),
        (t) => OrderingTerm(
              expression: const CustomExpression<int>(
                "CASE status WHEN 'В работе' THEN 1 WHEN 'Создана' THEN 2 WHEN 'Завершена' THEN 3 ELSE 4 END",
              ),
              mode: OrderingMode.asc,
            ),
        (t) => OrderingTerm(expression: t.name),
      ]);
    final tasks = await query.get();
    return tasks;
  }

  Future<int> insertNewTask(Task task) async {
    final companion = TaskItemsCompanion.insert(
      name: task.name,
      description: task.description,
      isDone: task.isDone,
      status: task.status,
      categoryId: task.categoryId!,
      deadline: task.deadline,
      plannedTime: task.plannedTime!,
    );

    return await into(taskItems).insert(companion);
  }

  Future<void> updateTask(Task entry) {
    return (update(taskItems)..where((t) => t.id.equals(entry.id!))).write(
      TaskItemsCompanion(
        name: Value(entry.name),
        description: Value(entry.description),
        categoryId: Value(entry.categoryId!),
        deadline: Value(entry.deadline),
        plannedTime: Value(entry.plannedTime!),
      ),
    );
  }

  Future<void> toggleIsDoneById(int id, bool isDone) async {
    await (update(taskItems)..where((t) => t.id.equals(id))).write(
      TaskItemsCompanion(
        isDone: Value(isDone),
      ),
    );
  }

  Future<void> updateStatusById(int id, String status) async {
    await (update(taskItems)..where((t) => t.id.equals(id))).write(
      TaskItemsCompanion(
        status: Value(const StatusConverter().fromSql(status)),
      ),
    );
  }

  Future<void> deleteTask(int id) {
    return (delete(taskItems)..where((t) => t.id.equals(id))).go();
  }

  ///
  ///
  /// Category
  ///
  ///

  Future<List<CategoryItem>> getAllCategories() async {
    return await select(categoryItems).get();
  }

  Future<CategoryItem> getCategory(int id) async {
    return (select(categoryItems)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<int> insertNewCategory(Category category) async {
    final companion = CategoryItemsCompanion.insert(
      name: category.name,
    );

    return await into(categoryItems).insert(companion);
  }

  Future<void> updateCategory(Category entry) {
    return (update(categoryItems)..where((t) => t.id.equals(entry.id!))).write(
      CategoryItemsCompanion(
        name: Value(entry.name),
      ),
    );
  }

  Future<void> deleteCategory(int id) {
    return (delete(categoryItems)..where((t) => t.id.equals(id))).go();
  }

  ///
  ///
  /// Achiv
  ///
  ///

  Future<List<AchievementItem>> getAllAchievements() async {
    return await select(achievementItems).get();
  }

  Future<int> addAchievement(Achievement achievement) async {
    final companion = AchievementItemsCompanion.insert(
      name: achievement.name,
      description: achievement.description,
    );

    return await into(achievementItems).insert(companion);
  }

  ///
  ///
  /// CompletedAchiv
  ///
  ///

  Future<int> insertNewCompeletedAchievement(int userId, int achievId) async {
    final companion = CompletedAchievementItemsCompanion.insert(
      userId: userId,
      achievementId: achievId,
    );

    return await into(completedAchievementItems).insert(companion);
  }

  Future<bool> checkCompletedAchievement(int userId, int achievementId) async {
    final query = select(completedAchievementItems)
      ..where((t) =>
          t.userId.equals(userId) & t.achievementId.equals(achievementId));

    final result = await query.get();
    return result.isNotEmpty;
  }

  ///
  ///
  /// ProgressAchiv
  ///
  ///

  Future<int> insertNewProgress(int userId) async {
    final companion = ProgressOfAchievementItemsCompanion.insert(
      userId: userId,
      progressAchievement1: 0,
      progressAchievement2: 0,
      progressAchievement3: 0,
    );

    return await into(progressOfAchievementItems).insert(companion);
  }

  Future<ProgressOfAchievementItem?> getProgress({
    required int userId,
  }) async {
    return await (select(progressOfAchievementItems)
          ..where((t) => t.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<void> updateProgress({
    required int userId,
    required ProgressOfAchievementItemsCompanion companion,
  }) async {
    await (update(progressOfAchievementItems)
          ..where((t) => t.userId.equals(userId)))
        .write(
      companion,
    );
  }

  ProgressOfAchievementItemsCompanion createCompanionAchievement1({
    required int value,
  }) {
    return ProgressOfAchievementItemsCompanion(
        progressAchievement1: Value(value));
  }

  ProgressOfAchievementItemsCompanion createCompanionAchievement2({
    required int value,
  }) {
    return ProgressOfAchievementItemsCompanion(
        progressAchievement2: Value(value));
  }

  ProgressOfAchievementItemsCompanion createCompanionAchievement3({
    required int value,
  }) {
    return ProgressOfAchievementItemsCompanion(
        progressAchievement3: Value(value));
  }

  Future<int> incrementedProgressAchievment1({required int userId}) async {
    final result = await getProgress(userId: userId);

    final newValue = result!.progressAchievement1 + 1;

    if (newValue == 5) {
      insertNewCompeletedAchievement(userId, 1);
    }

    await updateProgress(
        userId: userId,
        companion: createCompanionAchievement1(value: newValue));

    return userId;
  }

  Future<int> incrementedProgressAchievment2({required int userId}) async {
    final result = await getProgress(userId: userId);

    final newValue = result!.progressAchievement2 + 1;

    if (newValue == 5) {
      insertNewCompeletedAchievement(userId, 2);
    }

    await updateProgress(
        userId: userId,
        companion: createCompanionAchievement2(value: newValue));

    return userId;
  }

  Future<int> decrementedProgressAchievment2({required int userId}) async {
    final result = await getProgress(userId: userId);

    final newValue = result!.progressAchievement2 - 1;

    if (newValue == 5) {
      insertNewCompeletedAchievement(userId, 2);
    }

    await updateProgress(
        userId: userId,
        companion: createCompanionAchievement2(value: newValue));

    return userId;
  }

  Future<int> incrementedProgressAchievment3({
    required int userId,
  }) async {
    final result = await getProgress(userId: userId);

    final newValue = result!.progressAchievement3 + 1;

    if (newValue == 5) {
      insertNewCompeletedAchievement(userId, 3);
    }

    await updateProgress(
        userId: userId,
        companion: createCompanionAchievement3(value: newValue));

    return userId;
  }
}

class AppDataBaseSingleton {
  static final AppDatabase _instanse = AppDatabase();

  static AppDatabase get instanse => _instanse;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'spaceflight.sqlite'));

    // if (await file.exists()) {
    //   await file.delete();
    // }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
