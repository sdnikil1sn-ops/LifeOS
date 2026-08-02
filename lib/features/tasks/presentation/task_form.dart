import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import '../../../database/enums/task_enums.dart';

import '../../../database/database.dart';
import '../presentation/task_controller.dart';

class TaskForm extends StatefulWidget {
  final TaskController controller;

  const TaskForm({
    super.key,
    required this.controller,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    await widget.controller.addTask(
      TasksCompanion.insert(
        categoryId: 1,
        title: _title.text.trim(),
        priority: TaskPriority.medium,
        repeatType: RepeatType.none,
        description: Value(_description.text.trim()),
      ),
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _title,
                decoration:
                    const InputDecoration(labelText: "Title"),
                validator: (v) =>
                    v == null || v.isEmpty
                        ? "Enter title"
                        : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _description,
                decoration:
                    const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(height: 25),
              FilledButton(
                onPressed: _save,
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}