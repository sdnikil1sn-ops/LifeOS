import 'package:drift/drift.dart';
import '../../../database/database.dart';

class TaskRepository {
  final AppDatabase database;

  TaskRepository(this.database);

  Stream<List<Task>> watchTasks() {
    return database.select(database.tasks).watch();
  }

  Future<List<Task>> getAllTasks() {
    return database.select(database.tasks).get();
  }

  Future<Task?> getTask(int id) {
    return (database.select(database.tasks)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> addTask(TasksCompanion task) {
    return database.into(database.tasks).insert(task);
  }

  Future<bool> updateTask(Task task) {
    return database.update(database.tasks).replace(task);
  }

  Future<int> deleteTask(int id) {
    return (database.delete(database.tasks)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<int> archiveTask(int id) {
    return (database.update(database.tasks)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
          const TasksCompanion(
            isArchived: Value(true),
          ),
        );
  }

  Future<int> pendingCount() async {
    final data = await database.select(database.tasks).get();
    return data.where((e) => !e.isArchived).length;
  }

  Future<int> completedCount() async {
    final history = await database.select(database.taskHistory).get();
    return history.length;
  }
}