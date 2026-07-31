import 'package:flutter/material.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/events_card.dart';
import '../widgets/goal_card.dart';
import '../widgets/quote_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/today_tasks_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardHeader(),

            const SizedBox(height: 24),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.3,
              children: const [
                StatsCard(
                  icon: Icons.task_alt,
                  title: "Tasks",
                  value: "12",
                  color: Colors.blue,
                ),
                StatsCard(
                  icon: Icons.local_fire_department,
                  title: "Habits",
                  value: "80%",
                  color: Colors.orange,
                ),
                StatsCard(
                  icon: Icons.flag,
                  title: "Goals",
                  value: "4",
                  color: Colors.green,
                ),
                StatsCard(
                  icon: Icons.event,
                  title: "Events",
                  value: "2",
                  color: Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              "Today's Tasks",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            const TodayTasksCard(),

            const SizedBox(height: 24),

            Text(
              "Upcoming Events",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            const EventsCard(),

            const SizedBox(height: 24),

            const GoalCard(),

            const SizedBox(height: 24),

            const QuoteCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}