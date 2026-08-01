import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {

  final int completed;
  final int total;

  const StatsCard({
    super.key,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    final percent =
        total == 0 ? 0 : ((completed / total) * 100).round();

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Text(
              "$completed / $total",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            LinearProgressIndicator(
              value: total == 0 ? 0 : completed / total,
            ),

            const SizedBox(height: 8),

            Text("$percent % Completed"),

          ],

        ),

      ),

    );

  }

}