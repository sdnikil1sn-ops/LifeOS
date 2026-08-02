import 'package:flutter/material.dart';

import '../../../database/database.dart';
import '../data/task_repository.dart';
import '../domain/task_service.dart';
import 'task_controller.dart';
import 'task_form.dart';
import 'widgets/task_list.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final AppDatabase database;
  late final TaskController controller;

  @override
  void initState() {
    super.initState();

    database = AppDatabase();

    controller = TaskController(
      TaskService(
        TaskRepository(database),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: StreamBuilder<List<Task>>(
        stream: controller.watchTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return TaskList(
            tasks: snapshot.data!,
            onDelete: (task) async {
              await controller.deleteTask(task.id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskForm(
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }
}