
import '../../../database/database.dart';
import '../../../database/enums/task_enums.dart';
import '../data/occurrence_repository.dart';
import '../data/task_repository.dart';

class OccurrenceGenerator {
  final TaskRepository taskRepository;
  final OccurrenceRepository occurrenceRepository;

  OccurrenceGenerator({
    required this.taskRepository,
    required this.occurrenceRepository,
  });

  Future<void> generateUpcomingOccurrences({int daysAhead = 90}) async {
    final tasks = await taskRepository.getAllTasks();

    final now = DateTime.now();

    final limit = now.add(Duration(days: daysAhead));

    for (final task in tasks) {
      if (task.repeatType == RepeatType.none) {
        continue;
      }

      if (task.startDate == null) {
        continue;
      }

      await occurrenceRepository.deleteOccurrencesForTask(task.id);

      DateTime current = task.startDate!;

      while (!current.isAfter(limit)) {
        if (task.endDate != null && current.isAfter(task.endDate!)) {
          break;
        }

        await occurrenceRepository.insertOccurrence(
          TaskOccurrencesCompanion.insert(
            taskId: task.id,
            occurrenceDate: current,
          ),
        );

        current = _nextOccurrence(current, task.repeatType);
      }
    }
  }

  DateTime _nextOccurrence(DateTime current, RepeatType repeatType) {
    switch (repeatType) {
      case RepeatType.daily:
        return current.add(const Duration(days: 1));

      case RepeatType.weekly:
        return current.add(const Duration(days: 7));

      case RepeatType.monthly:
        return DateTime(
          current.year,
          current.month + 1,
          current.day,
          current.hour,
          current.minute,
        );

      case RepeatType.yearly:
        return DateTime(
          current.year + 1,
          current.month,
          current.day,
          current.hour,
          current.minute,
        );

      case RepeatType.custom:
        // Sprint 6
        return current.add(const Duration(days: 1));

      case RepeatType.none:
        return current;
    }
  }
}
