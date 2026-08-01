import 'package:flutter/material.dart';

import '../data/dashboard_repository.dart';
import 'dashboard_controller.dart';

import '../../../database/database.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/stats_card.dart';
import '../widgets/today_tasks_card.dart';
import '../widgets/goal_card.dart';
import '../widgets/quote_card.dart';

class DashboardScreen extends StatefulWidget {

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();

}

class _DashboardScreenState extends State<DashboardScreen> {

  late DashboardController controller;

  @override
  void initState() {

    super.initState();

    controller = DashboardController(
      DashboardRepository(AppDatabase()),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder(

        future: controller.loadStats(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          }

          final stats = snapshot.data!;

          return SingleChildScrollView(

            padding: const EdgeInsets.all(16),

            child: Column(

              children: [

                const DashboardHeader(),

                const SizedBox(height: 20),

                StatsCard(
                  completed: stats.completedTasks,
                  total: stats.totalTasks,
                ),

                const SizedBox(height: 20),

                GoalCard(
                  completed: stats.completedTasks,
                  target: stats.totalTasks,
                ),

                const SizedBox(height: 20),

                const QuoteCard(),

                const SizedBox(height: 20),

                StreamBuilder<List<Task>>(

                  stream: controller.watchTodayTasks(),

                  builder: (_, snapshot) {

                    return TodayTasksCard(
                      tasks: snapshot.data ?? [],
                    );

                  },

                ),

              ],

            ),

          );

        },

      ),

    );

  }

}