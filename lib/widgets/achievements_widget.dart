import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/achievement/achievement.dart';
import 'package:flutter_application_2/widgets/achievement_widget.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AchievementsWidget extends StatelessWidget {
  final List<Achievement> achievements;
  const AchievementsWidget({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Достижения"),
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
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Gap(20),
          itemCount: achievements.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder<bool>(
                future: Provider.of<TasksRepository>(context, listen: false)
                    .checkCompletedAchievement(0, achievements[index].id!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    bool isUnlocked = snapshot.data ?? false;
                    return AchievementWidget(
                      achievement: achievements[index],
                      isUnlocked: isUnlocked,
                    );
                  } else {
                    return const SizedBox();
                  }
                });
          }),
    );
  }
}
