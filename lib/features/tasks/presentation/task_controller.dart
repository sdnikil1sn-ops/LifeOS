import '../../../database/database.dart';
import '../domain/task_service.dart';

class TaskController {
  final TaskService service;

  TaskController(this.service);

  Stream<List<Task>> watchTasks() {
    return service.watchTasks();
  }

  Future<List<Task>> loadTasks() {
    return service.getTasks();
  }

  Future<int> addTask(TasksCompanion task) {
    return service.createTask(task);
  }

  Future<bool> updateTask(Task task) {
    return service.updateTask(task);
  }

  Future<int> deleteTask(int id) {
    return service.deleteTask(id);
  }

  Future<Task?> getTask(int id) {
    return service.getTask(id);
  }

  Future<int> archiveTask(int id) {
    return service.archiveTask(id);
  }

  Future<int> pendingCount() {
    return service.pendingCount();
  }

  Future<int> completedCount() {
    return service.completedCount();
  }
}