import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.pinkAccent),
          borderRadius: const BorderRadius.all(Radius.circular(32))),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 160),
              child: Text(
                category.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Gap(10),
            SizedBox(
              width: 20,
              child: IconButton(
                onPressed: () async {
                  context.read<TasksBloc>().add(
                      TasksEvent.toCreateUpdateCategory(category: category));
                },
                icon: const Icon(Icons.edit),
                iconSize: 14,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.comfortable,
              ),
            ),
            SizedBox(
              width: 20,
              child: IconButton(
                onPressed: () => {
                  Provider.of<TasksRepository>(context, listen: false)
                      .deleteCategory(category.id!),
                  context
                      .read<TasksBloc>()
                      .add(const TasksEvent.toCategories()),
                },
                icon: const Icon(Icons.close),
                iconSize: 14,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
