import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TaskDetail extends StatelessWidget {
  final Task task;
  const TaskDetail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Future<Category> getCategory(int id) async {
      final category =
          await Provider.of<TasksRepository>(context, listen: false)
              .getCategory(task.categoryId!);
      return category;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Информация о задаче",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              context.read<TasksBloc>().add(const TasksEvent.toTasks()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Название задачи: ${task.name}"),
              const Gap(20),
              Text("Описание задачи: ${task.description}"),
              const Gap(20),
              FutureBuilder<Category>(
                future: getCategory(task.categoryId!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("Категория задачи: ${snapshot.data!.name}");
                  } else {
                    return const Text("");
                  }
                },
              ),
              const Gap(20),
              Text(
                  "Дедлайн: ${Provider.of<TasksRepository>(context, listen: false).dateFormatter(task.deadline)}"),
              const Gap(20),
              Text(
                  "Планироваемое время выполнения задачи в часах: ${task.plannedTime}"),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () => context
                          .read<TasksBloc>()
                          .add(TasksEvent.toCreateUpdateTask(task: task)),
                      child: const Text("Изменить"),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () => {
                        Provider.of<TasksRepository>(context, listen: false)
                            .deleteTask(task.id!),
                        context
                            .read<TasksBloc>()
                            .add(const TasksEvent.toTasks()),
                      },
                      child: const Text("Удалить"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
