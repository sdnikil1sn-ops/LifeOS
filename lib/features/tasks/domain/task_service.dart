import '../../../database/database.dart';
import '../data/task_repository.dart';

class TaskService {
  final TaskRepository repository;

  TaskService(this.repository);

  Future<List<Task>> getTasks() {
    return repository.getAllTasks();
  }

  Stream<List<Task>> watchTasks() {
    return repository.watchTasks();
  }

  Future<int> createTask(TasksCompanion task) async {
    if (!task.title.present || task.title.value.trim().isEmpty) {
      throw Exception('Task title cannot be empty');
    }

    return repository.addTask(task);
  }

  Future<bool> updateTask(Task task) async {
    if (task.title.trim().isEmpty) {
      throw Exception('Task title cannot be empty');
    }

    return repository.updateTask(task);
  }

  Future<int> deleteTask(int id) {
    return repository.deleteTask(id);
  }

  Future<Task?> getTask(int id) {
    return repository.getTask(id);
  }

  Future<int> archiveTask(int id) {
    return repository.archiveTask(id);
  }

  Future<int> pendingCount() {
    return repository.pendingCount();
  }

  Future<int> completedCount() {
    return repository.completedCount();
  }
}