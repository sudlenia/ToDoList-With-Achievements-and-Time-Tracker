import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CreateUpdateCategoryWidget extends StatelessWidget {
  final Category? category;
  const CreateUpdateCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final nameCntr = TextEditingController(text: category?.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category == null ? "Создание категории" : "Редактирование категории",
          style: const TextStyle(fontSize: 20),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              context.read<TasksBloc>().add(const TasksEvent.toCategories()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          TextField(
            controller: nameCntr,
            decoration: InputDecoration(
                labelText: "Название",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: nameCntr.clear,
                )),
          ),
          const Gap(10),
          category == null
              ? FilledButton(
                  child: const Text("Добавить"),
                  onPressed: () => {
                    context.read<TasksBloc>().add(
                          TasksEvent.createdUpdatedCategory(
                            category: Category(name: nameCntr.text),
                          ),
                        )
                  },
                )
              : FilledButton(
                  child: const Text("Изменить"),
                  onPressed: () => {
                    context.read<TasksBloc>().add(
                          TasksEvent.createdUpdatedCategory(
                              category: Category(
                            id: category!.id,
                            name: nameCntr.text,
                          )),
                        )
                  },
                )
        ]),
      ),
    );
  }
}
