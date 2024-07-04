import 'package:flutter_application_2/data/database/app_database.dart';
import 'package:flutter_application_2/domain/exceptions/validation_exception.dart';
import 'package:flutter_application_2/domain/i_tasks_repository.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:intl/intl.dart';

class TasksRepository implements ITasksRepository {
  final db = AppDataBaseSingleton.instanse;

  @override
  Future<List<Task>> getAllTasks() async {
    final taskItems = await db.getAllTasks();
    final tasks = taskItems.map((e) => Task.fromDatabase(e)).toList();

    return tasks;
  }

  @override
  Future<void> insertNewTask(Task task) async {
    await db.insertNewTask(task);
  }

  @override
  Future<void> toggleIsDone(int id, bool isDone) async {
    await db.toggleIsDoneById(id, isDone);
  }

  @override
  Future<void> updateStatus(int id, Status newStatus) async {
    await db.updateStatusById(id, newStatus.name);
  }

  @override
  Future<List<Category>> getAllCategories() async {
    final categoryItems = await db.getAllCategories();
    final categories =
        categoryItems.map((e) => Category.fromDatabase(e)).toList();

    return categories;
  }

  @override
  Future<void> insertNewCategory(Category category) async {
    await db.insertNewCategory(category);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await db.deleteCategory(id);
  }

  @override
  Future<Category> getCategory(int id) async {
    return Category.fromDatabase(await db.getCategory(id));
  }

  @override
  Future<void> updateCategory(Category category) async {
    return await db.updateCategory(category);
  }

  @override
  Future<void> updateTask(Task task) async {
    return await db.updateTask(task);
  }

  @override
  String dateFormatter(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date).toString();
  }

  @override
  Future<void> deleteTask(int id) async {
    await db.deleteTask(id);
  }

  @override
  Future<List<Achievement>> getAllAchievements() async {
    final achievementItem = await db.getAllAchievements();
    final achievements =
        achievementItem.map((e) => Achievement.fromDatabase(e)).toList();

    return achievements;
  }

  @override
  Future<void> insertNewAchievement(Achievement achievement) async {
    await db.addAchievement(achievement);
  }

  @override
  Future<void> insertNewProgress(int userId) async {
    await db.insertNewProgress(userId);
  }

  @override
  Future<bool> checkCompletedAchievement(int userId, int achievementId) async {
    return await db.checkCompletedAchievement(userId, achievementId);
  }

  @override
  Future<void> incrementedProgressAchievment1({required int userId}) async {
    await db.incrementedProgressAchievment1(userId: userId);
  }

  @override
  Future<void> incrementedProgressAchievment2({required int userId}) async {
    await db.incrementedProgressAchievment2(userId: userId);
  }

  @override
  Future<void> decrementedProgressAchievment2({required int userId}) async {
    await db.decrementedProgressAchievment2(userId: userId);
  }

  @override
  Future<void> incrementedProgressAchievment3({required int userId}) async {
    await db.incrementedProgressAchievment3(userId: userId);
  }

  @override
  void validateCategory(Category category) {
    if (category.name.isEmpty) {
      throw const ValidationException(
          "Название категории не может быть пустым");
    }
  }

  @override
  void validateTask(Task task) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final ddl = task.deadline;
    final deadline = DateTime(ddl.year, ddl.month, ddl.day);
    
    if (task.name.isEmpty) {
      throw const ValidationException("Название задачи не может быть пустым");
    } else if (task.description.isEmpty) {
      throw const ValidationException("Описание задачи не может быть пустым");
    } else if (task.categoryId == null) {
      throw const ValidationException(
          "У задачи должна быть категория - создайте её");
    } else if (deadline.isBefore(today)) {
      throw const ValidationException(
          "Дедлайн не может быть раньше сегодня дня");
    } else if (task.plannedTime == null) {
      throw const ValidationException(
          "Планируемое время должно быть корректным");
    }
  }
}
