import 'package:flutter/material.dart';

class TodayTasksCard extends StatelessWidget {
  const TodayTasksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Flutter Development"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Gym Workout"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Read 20 Pages"),
          ),
        ],
      ),
    );
  }
}