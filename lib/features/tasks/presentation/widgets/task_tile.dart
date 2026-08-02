import 'package:flutter/material.dart';

import '../../../../database/database.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const TaskTile({
    super.key,
    required this.task,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: const Icon(Icons.check_circle_outline),
        title: Text(task.title),
        subtitle: Text(
          task.description ?? "No description",
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onDelete,
        ),
        onTap: onTap,
      ),
    );
  }
}