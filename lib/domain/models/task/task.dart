import 'package:flutter_application_2/data/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
      int? id,
      required String name,
      required String description,
      required bool isDone,
      required Status status,
      int? categoryId,
      required DateTime deadline,
      double? plannedTime,
      }) = _Task;

  factory Task.fromDatabase(TaskItem item) => Task(
      id: item.id,
      name: item.name,
      description: item.description,
      isDone: item.isDone,
      status: item.status,
      categoryId: item.categoryId,
      deadline: item.deadline,
      plannedTime: item.plannedTime,
      );
}

enum Status {
  created("Создана"),
  inProgress("В работе"),
  done("Завершена");

  final String name;

  const Status(this.name);
}
