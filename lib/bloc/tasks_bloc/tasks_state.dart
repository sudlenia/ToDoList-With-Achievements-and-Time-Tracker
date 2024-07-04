part of 'tasks_bloc.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.loading() = _Loading;
  const factory TasksState.failed({required String errorText}) = _Failed;
  const factory TasksState.failMessageForCreateUpdateTask(
      {required String errorText,
      Task? task}) = _FailMessageForCreateUpdateTask;
  const factory TasksState.failMessageForCreateUpdateCategory(
      {required String errorText,
      Category? category}) = _FailMessageForCreateUpdateCategory;
  const factory TasksState.tasks({
    required List<Task> tasks,
  }) = _Tasks;
  const factory TasksState.createUpdateTask({
    Task? task,
  }) = _CreateTask;
  const factory TasksState.createUpdateCategory({
    Category? category,
  }) = _UpdateCategory;
  const factory TasksState.categories({
    required List<Category> categories,
  }) = _Categories;
  const factory TasksState.taskDetail({
    required Task task,
  }) = _TaskDetail;
  const factory TasksState.achievements({
    required List<Achievement> achievements,
  }) = _Achievements;
}
