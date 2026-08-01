  import '../data/dashboard_repository.dart';
  import '../domain/dashboard_stats.dart';
  import '../../../database/database.dart';

  class DashboardController {

    final DashboardRepository repository;

    DashboardController(this.repository);

    Future<DashboardStats> loadStats() async {

      final total = await repository.totalTasks();

      final pending = await repository.pendingTasks();

      final completed = total - pending;

      return DashboardStats(
        totalTasks: total,
        completedTasks: completed,
        pendingTasks: pending,
        streak: 5,
      );
    }

    Stream<List<Task>> watchTodayTasks() {
      return repository.watchTodayTasks();
    }

  }