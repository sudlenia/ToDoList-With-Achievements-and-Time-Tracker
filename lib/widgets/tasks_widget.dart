import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:flutter_application_2/widgets/task_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TasksWidget extends StatelessWidget {
  final List<Task> tasks;
  const TasksWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Задачи"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              tooltip: 'Задачи',
              icon: const Icon(Icons.format_list_bulleted),
              onPressed: () =>
                  context.read<TasksBloc>().add(const TasksEvent.toTasks()),
            ),
            IconButton(
              tooltip: 'Категории',
              icon: const Icon(Icons.dashboard),
              onPressed: () => context
                  .read<TasksBloc>()
                  .add(const TasksEvent.toCategories()),
            ),
            IconButton(
              tooltip: 'Достижения',
              icon: const Icon(Icons.star),
              onPressed: () => context
                  .read<TasksBloc>()
                  .add(const TasksEvent.toAchievements()),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          context.read<TasksBloc>().add(const TasksEvent.toCreateUpdateTask()),
          // Provider.of<TasksRepository>(context, listen: false)
          //     .insertNewAchievement(const Achievement(
          //         name: "Это только начало", description: "Создайте 5 задач")),
          // Provider.of<TasksRepository>(context, listen: false)
          //     .insertNewAchievement(const Achievement(
          //         name: "Это уже успех!", description: "Выполните 5 задач")),
          // Provider.of<TasksRepository>(context, listen: false)
          //     .insertNewAchievement(const Achievement(
          //         name: "По полочкам", description: "Создайте 5 категорий")),
          // Provider.of<TasksRepository>(context, listen: false)
          //     .insertNewProgress(0),
        },
        tooltip: 'Добавить задачу',
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
          itemCount: tasks.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == tasks.length) {
              return const SizedBox(height: 70);
            }
            return TaskWidget(
              task: tasks[index],
            );
          }),
    );
  }
}
