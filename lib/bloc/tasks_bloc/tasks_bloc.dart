import 'dart:async';

import 'package:flutter_application_2/domain/exceptions/validation_exception.dart';
import 'package:flutter_application_2/domain/i_tasks_repository.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';
part 'tasks_bloc.freezed.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final ITasksRepository _repository;

  TasksBloc(this._repository) : super(const TasksState.loading()) {
    on<TasksEvent>((event, emit) async {
      await event.map(
          toTasks: (_) => _toTasks(emit),
          toCategories: (_) => _toCategories(emit),
          toCreateUpdateCategory: (event) =>
              _toCreateUpdateCategory(event, emit),
          createdUpdatedCategory: (event) =>
              _createdUpdatedCategory(event, emit),
          toTaskDetail: (event) => _toTaskDetail(event, emit),
          toCreateUpdateTask: (event) => _toCreateUpdateTask(event, emit),
          createdUpdatedTask: (event) => _createdUpdatedTask(event, emit),
          toAchievements: (event) => _toAchievements(event, emit));
    });
  }

  FutureOr<void> _toTasks(Emitter<TasksState> emit) async {
    try {
      final tasks = await _repository.getAllTasks();
      emit(TasksState.tasks(tasks: tasks));
    } catch (e) {
      emit(const TasksState.failed(errorText: "Ошибка при обращении к БД"));
    }
  }

  FutureOr<void> _toCategories(Emitter<TasksState> emit) async {
    try {
      final categories = await _repository.getAllCategories();
      emit(TasksState.categories(categories: categories));
    } catch (e) {
      emit(const TasksState.failed(errorText: "Ошибка при обращении к БД"));
    }
  }

  FutureOr<void> _toCreateUpdateCategory(
      _ToCreateUpdateCategory event, Emitter<TasksState> emit) async {
    if (event.category != null) {
      emit(TasksState.createUpdateCategory(category: event.category));
    } else {
      emit(const TasksState.createUpdateCategory());
    }
  }

  FutureOr<void> _createdUpdatedCategory(
      _CreatedUpdatedCategory event, Emitter<TasksState> emit) async {
    final category = event.category;
    try {
      _repository.validateCategory(category);

      if (category.id != null) {
        await _repository.updateCategory(event.category);
      } else {
        await _repository.insertNewCategory(event.category);
        await _repository.incrementedProgressAchievment3(userId: 0);
      }

      final categories = await _repository.getAllCategories();
      emit(TasksState.categories(categories: categories));
    } catch (e) {
      if (e is ValidationException) {
        emit(TasksState.failMessageForCreateUpdateCategory(
            errorText: e.message));
        if (category.id != null) {
          add(TasksEvent.toCreateUpdateCategory(
              category: category.copyWith(name: "")));
        } else {
          add(const TasksEvent.toCreateUpdateCategory());
        }
      } else {
        emit(TasksState.failed(
            errorText: category.id != null
                ? "Ошибка при изменении категории"
                : "Ошибка при добавлении новой категории"));
      }
    }
  }

  FutureOr<void> _toTaskDetail(
      _ToTaskDetail event, Emitter<TasksState> emit) async {
    emit(TasksState.taskDetail(task: event.task));
  }

  FutureOr<void> _toCreateUpdateTask(
      _ToCreateUpdateTask event, Emitter<TasksState> emit) async {
    if (event.task != null && event.task!.id != null) {
      emit(TasksState.createUpdateTask(task: event.task));
    } else {
      emit(const TasksState.createUpdateTask());
    }
  }

  FutureOr<void> _createdUpdatedTask(
      _CreatedTask event, Emitter<TasksState> emit) async {
    final task = event.task;

    try {
      _repository.validateTask(task);

      if (task.id != null) {
        await _repository.updateTask(task);
      } else {
        await _repository.insertNewTask(task);
        await _repository.incrementedProgressAchievment1(userId: 0);
      }

      final tasks = await _repository.getAllTasks();
      emit(TasksState.tasks(tasks: tasks));
    } catch (e) {
      if (e is ValidationException) {
        emit(TasksState.failMessageForCreateUpdateTask(errorText: e.message));
        add(TasksEvent.toCreateUpdateTask(task: task));
      } else {
        emit(TasksState.failed(
            errorText: task.id != null
                ? "Ошибка при изменении задачи"
                : "Ошибка при добавлении новой задачи"));
      }
    }
  }

  _toAchievements(_ToAchievements event, Emitter<TasksState> emit) async {
    try {
      final achievements = await _repository.getAllAchievements();
      emit(TasksState.achievements(achievements: achievements));
    } catch (e) {
      emit(const TasksState.failed(errorText: "Ошибка при обращении к БД"));
    }
  }
}
