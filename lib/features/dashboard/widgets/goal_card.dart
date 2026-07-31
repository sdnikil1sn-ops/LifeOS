import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.flag),
        title: const Text("Today's Goal"),
        subtitle: const Text("Finish Sprint 2"),
      ),
    );
  }
}