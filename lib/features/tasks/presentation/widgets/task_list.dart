import 'package:flutter/material.dart';

import '../../../../database/database.dart';
import 'empty_state.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task)? onTap;
  final void Function(Task)? onDelete;

  const TaskList({
    super.key,
    required this.tasks,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const EmptyState();
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return TaskTile(
          task: task,
          onTap: () => onTap?.call(task),
          onDelete: () => onDelete?.call(task),
        );
      },
    );
  }
}