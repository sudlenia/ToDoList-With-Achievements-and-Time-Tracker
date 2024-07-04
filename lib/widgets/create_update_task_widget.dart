import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:flutter_application_2/data/tasks_repository.dart';
import 'package:flutter_application_2/domain/models/category/category.dart';
import 'package:flutter_application_2/domain/models/task/task.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CreateUpdateTaskWidget extends StatefulWidget {
  final Task? task;
  const CreateUpdateTaskWidget({super.key, this.task});

  @override
  CreateWidgetState createState() => CreateWidgetState();
}

class CreateWidgetState extends State<CreateUpdateTaskWidget> {
  final nameCntr = TextEditingController();
  final descrCntr = TextEditingController();
  final timeCntr = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Category>? categories;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _initializeCategories();
    if (widget.task != null) {
      _initializeTask();
    }
  }

  Future<void> _initializeTask() async {
    if (widget.task != null) {
      setState(() {
        nameCntr.text = widget.task!.name;
        descrCntr.text = widget.task!.description;
        timeCntr.text = widget.task!.plannedTime?.toString() ?? '';
        _selectedDate = widget.task!.deadline;
      });

      Category? category;
      if (widget.task!.categoryId != null) {
        try {
          category = await Provider.of<TasksRepository>(context, listen: false)
              .getCategory(widget.task!.categoryId!);
        } catch (e) {}
      }
      setState(() {
        _selectedCategory = category;
      });
    }
  }

  Future<void> _initializeCategories() async {
    List<Category> categories =
        await Provider.of<TasksRepository>(context, listen: false)
            .getAllCategories();
    setState(() {
      this.categories = categories;
      _selectedCategory = categories.isNotEmpty ? categories[0] : null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.task == null ? "Создание задачи" : "Редактирование задачи",
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              context.read<TasksBloc>().add(const TasksEvent.toTasks()),
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
          TextField(
            controller: descrCntr,
            decoration: InputDecoration(
                labelText: "Описание",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: descrCntr.clear,
                )),
          ),
          const Gap(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                child: TextField(
                  controller: timeCntr,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Время выполнения",
                  ),
                ),
              ),
              const Gap(12),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text('час(а/ов)'),
              ),
            ],
          ),
          const Gap(10),
          categories == null
              ? const CircularProgressIndicator()
              : DropdownButton<Category>(
                  value: _selectedCategory,
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  isExpanded: true,
                  menuMaxHeight: 300,
                  items: categories!.map((category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(
                        category.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
          const Gap(10),
          Row(
            children: [
              Text(
                  "Дедлайн: ${Provider.of<TasksRepository>(context, listen: false).dateFormatter(_selectedDate)}"),
              const Gap(10),
              SizedBox(
                width: 50,
                child: TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Icon(Icons.calendar_month),
                ),
              ),
            ],
          ),
          const Gap(10),
          widget.task == null
              ? FilledButton(
                  child: const Text("Добавить"),
                  onPressed: () => {
                    context.read<TasksBloc>().add(
                          TasksEvent.createdUpdatedTask(
                              task: Task(
                            name: nameCntr.text,
                            description: descrCntr.text,
                            isDone: false,
                            status: Status.created,
                            categoryId: _selectedCategory?.id,
                            deadline: _selectedDate,
                            plannedTime: double.tryParse(timeCntr.text),
                          )),
                        )
                  },
                )
              : FilledButton(
                  child: const Text("Изменить"),
                  onPressed: () => {
                    context.read<TasksBloc>().add(
                          TasksEvent.createdUpdatedTask(
                              task: Task(
                            id: widget.task!.id,
                            name: nameCntr.text,
                            description: descrCntr.text,
                            isDone: false,
                            status: Status.created,
                            categoryId: _selectedCategory?.id,
                            deadline: _selectedDate,
                            plannedTime: double.tryParse(timeCntr.text)
                          )),
                        )
                  },
                )
        ]),
      ),
    );
  }
}
