import '../../../database/database.dart';

class DashboardRepository {
  final AppDatabase db;

  DashboardRepository(this.db);

  Future<int> totalTasks() async {
    final tasks = await db.select(db.tasks).get();
    return tasks.length;
  }

  Future<int> pendingTasks() async {
    final tasks = await db.select(db.tasks).get();
    return tasks.where((e) => !e.isArchived).length;
  }

  Future<List<Task>> todayTasks() async {
    return db.select(db.tasks).get();
  }

  Stream<List<Task>> watchTodayTasks() {
    return db.select(db.tasks).watch();
  }
}