import 'package:flutter/material.dart';
import '../../../database/database.dart';

class TodayTasksCard extends StatelessWidget {

  final List<Task> tasks;

  const TodayTasksCard({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {

    if (tasks.isEmpty) {

      return const Card(

        child: Padding(

          padding: EdgeInsets.all(20),

          child: Text(
            "No tasks today\nTap + to create one.",
          ),

        ),

      );

    }

    return Card(

      child: ListView.builder(

        shrinkWrap: true,

        physics: const NeverScrollableScrollPhysics(),

        itemCount: tasks.length,

        itemBuilder: (_, index) {

          final task = tasks[index];

          return ListTile(

            title: Text(task.title),

          );

        },

      ),

    );

  }

}