import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {

  final int completed;
  final int target;

  const GoalCard({
    super.key,
    required this.completed,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            const Text("Today's Goal"),

            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: target == 0 ? 0 : completed / target,
            ),

            const SizedBox(height: 8),

            Text("$completed / $target"),

          ],

        ),

      ),

    );

  }

}