import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/widgets/category_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Категории"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              tooltip: 'Задачи',
              icon: const Icon(Icons.format_list_bulleted),
              onPressed: () => context.read<TasksBloc>().add(const TasksEvent.toTasks()),
            ),
            IconButton(
              tooltip: 'Категории',
              icon: const Icon(Icons.dashboard),
              onPressed: () => context.read<TasksBloc>().add(const TasksEvent.toCategories()),
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
        onPressed: () =>
            context.read<TasksBloc>().add(const TasksEvent.toCreateUpdateCategory()),
        tooltip: 'Добавить категорию',
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: categories.map((category) {
              return CategoryWidget(category: category);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
