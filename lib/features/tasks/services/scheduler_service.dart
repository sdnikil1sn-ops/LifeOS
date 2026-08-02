import '../data/task_repository.dart';
import 'occurrence_generator.dart';

class SchedulerService {
  final TaskRepository taskRepository;
  final OccurrenceGenerator occurrenceGenerator;

  SchedulerService({
    required this.taskRepository,
    required this.occurrenceGenerator,
  });

  Future<void> generateUpcoming() async {
    final tasks = await taskRepository.getAllTasks();

    for (final task in tasks) {
      await occurrenceGenerator.generateOccurrencesForTask(task);
    }
  }
}