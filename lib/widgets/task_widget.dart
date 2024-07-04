import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/database/task_table.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  const TaskWidget({super.key, required this.task});

  @override
  TaskWidgetState createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  late Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  void _updateStatus(Status status) {
    task = task.copyWith(status: status);
    Provider.of<TasksRepository>(context, listen: false)
        .updateStatus(task.id!, status);
  }

  void _toggleIsDone(bool isDone) {
    task = task.copyWith(isDone: isDone);
    if (isDone) {
      Provider.of<TasksRepository>(context, listen: false)
          .incrementedProgressAchievment2(userId: 0);
    } else {
      Provider.of<TasksRepository>(context, listen: false)
          .decrementedProgressAchievment2(userId: 0);
    }
    Provider.of<TasksRepository>(context, listen: false)
        .toggleIsDone(task.id!, isDone);
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _updateStatus(value! ? Status.done : Status.created);
      _toggleIsDone(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<TasksBloc>().add(TasksEvent.toTaskDetail(task: task)),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: _toggleCheckbox,
            ),
            const Gap(10),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      "Дедлайн: ${Provider.of<TasksRepository>(context, listen: false).dateFormatter(task.deadline)}"),
                ],
              ),
            ),
            const Gap(20),
            DropdownButton<String>(
              value: task.status.name,
              items: Status.values.map((Status status) {
                return DropdownMenuItem<String>(
                  value: status.name,
                  child:
                      Text(status.name, style: const TextStyle(fontSize: 14)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    final status = const StatusConverter().fromSql(newValue);
                    _toggleIsDone(status == Status.done ? true : false);
                    _updateStatus(status);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
