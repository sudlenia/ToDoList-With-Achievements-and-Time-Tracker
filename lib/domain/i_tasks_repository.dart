import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';

abstract class ITasksRepository {
  Future<List<Task>> getAllTasks();

  Future<void> insertNewTask(Task task);

  String dateFormatter(DateTime date);

  Future<void> toggleIsDone(int id, bool isDone);

  Future<void> updateStatus(int id, Status newStatus);

  Future<void> deleteTask(int id);

  Future<List<Category>> getAllCategories();

  Future<void> insertNewCategory(Category category);

  Future<void> deleteCategory(int id);

  Future<Category> getCategory(int id);

  Future<void> updateCategory(Category category);

  Future<void> updateTask(Task category);

  Future<List<Achievement>> getAllAchievements();

  Future<void> insertNewAchievement(Achievement achievement);

  Future<void> insertNewProgress(int userId);

  Future<bool> checkCompletedAchievement(int userId, int achievementId);

  Future<void> incrementedProgressAchievment1({
    required int userId,
  });
  
  Future<void> incrementedProgressAchievment2({
    required int userId,
  });

  Future<void> decrementedProgressAchievment2({
    required int userId,
  });

  Future<void> incrementedProgressAchievment3({
    required int userId,
  });

  void validateCategory(Category category);

  void validateTask(Task task);
}
