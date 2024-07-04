part of 'tasks_bloc.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.toTasks() = _ToTasks;
  const factory TasksEvent.toTaskDetail({
    required Task task,
  }) = _ToTaskDetail;
  const factory TasksEvent.toCategories() = _ToCategories;
  const factory TasksEvent.toAchievements() = _ToAchievements;
  const factory TasksEvent.toCreateUpdateCategory({
    Category? category,
  }) = _ToCreateUpdateCategory;
  const factory TasksEvent.createdUpdatedCategory({
    required Category category,
  }) = _CreatedUpdatedCategory;
  const factory TasksEvent.toCreateUpdateTask({
    Task? task,
  }) = _ToCreateUpdateTask;
  const factory TasksEvent.createdUpdatedTask({
    required Task task,
  }) = _CreatedTask;
}
