import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/widgets/achievements_widget.dart';
import 'package:flutter_application_2/widgets/categories_widget.dart';
import 'package:flutter_application_2/widgets/create_update_category_widget.dart';
import 'package:flutter_application_2/widgets/create_update_task_widget.dart';
import 'package:flutter_application_2/widgets/failed_widget.dart';
import 'package:flutter_application_2/widgets/loading_widget.dart';
import 'package:flutter_application_2/widgets/task_detail.dart';
import 'package:flutter_application_2/widgets/tasks_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  SnackBar createCustomSnackBar({
    required String errorText,
    required VoidCallback onClose,
  }) {
    return SnackBar(
      content: Text(errorText),
      duration: const Duration(seconds: 20),
      action: SnackBarAction(
        label: 'Закрыть',
        onPressed: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<TasksRepository>(
      create: (context) => TasksRepository(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.pinkAccent,
        ),
        home: BlocProvider(
            create: (context) =>
                TasksBloc(TasksRepository())..add(const TasksEvent.toTasks()),
            child: BlocConsumer<TasksBloc, TasksState>(
              listenWhen: (p, c) => p != c || p == c,
              listener: (context, state) {
                state.whenOrNull(
                  failMessageForCreateUpdateTask: (errorText, task) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        createCustomSnackBar(
                            errorText: errorText,
                            onClose: () => ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar()));
                  },
                  failMessageForCreateUpdateCategory: (errorText, category) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        createCustomSnackBar(
                            errorText: errorText,
                            onClose: () => ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar()));
                  },
                );
              },
              buildWhen: (p, c) => p != c,
              builder: (context, state) {
                return BlocBuilder<TasksBloc, TasksState>(
                    buildWhen: (p, c) => p != c,
                    builder: (context, state) {
                      return state.map(
                        loading: (_) => const LoadingWidget(),
                        failed: (value) =>
                            FailedWidget(errorText: value.errorText),
                        failMessageForCreateUpdateTask: (value) =>
                            CreateUpdateTaskWidget(task: value.task),
                        tasks: (value) => TasksWidget(
                          tasks: value.tasks,
                        ),
                        createUpdateTask: (value) =>
                            CreateUpdateTaskWidget(task: value.task),
                        categories: (value) =>
                            CategoriesWidget(categories: value.categories),
                        createUpdateCategory: (value) =>
                            CreateUpdateCategoryWidget(
                          category: value.category,
                        ),
                        failMessageForCreateUpdateCategory: (value) =>
                            CreateUpdateCategoryWidget(
                          category: value.category,
                        ),
                        taskDetail: (value) => TaskDetail(task: value.task),
                        achievements: (value) => AchievementsWidget(
                            achievements: value.achievements),
                      );
                    });
              },
            )),
      ),
    );
  }
}
