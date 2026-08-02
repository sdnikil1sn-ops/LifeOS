import '../../../database/database.dart';
import '../../tasks/data/occurrence_repository.dart';
import '../../tasks/data/task_repository.dart';
import '../domain/calendar_event.dart';
import 'calendar_repository.dart';

class CalendarRepositoryImpl
    implements CalendarRepository {
  final TaskRepository taskRepository;
  final OccurrenceRepository occurrenceRepository;

  CalendarRepositoryImpl({
    required this.taskRepository,
    required this.occurrenceRepository,
  });

  @override
  Future<List<CalendarEvent>> getEventsForDay(
    DateTime day,
  ) {
    return getEventsBetween(
      DateTime(day.year, day.month, day.day),
      DateTime(
        day.year,
        day.month,
        day.day,
        23,
        59,
        59,
      ),
    );
  }

  @override
  Future<List<CalendarEvent>> getEventsForMonth(
    DateTime month,
  ) {
    final first = DateTime(
      month.year,
      month.month,
      1,
    );

    final last = DateTime(
      month.year,
      month.month + 1,
      0,
      23,
      59,
      59,
    );

    return getEventsBetween(
      first,
      last,
    );
  }

  @override
  Future<List<CalendarEvent>> getEventsBetween(
    DateTime from,
    DateTime to,
  ) async {
    final occurrences =
        await occurrenceRepository.getOccurrencesBetween(
      from,
      to,
    );

    final List<CalendarEvent> events = [];

    for (final occurrence in occurrences) {
      final Task? task = await taskRepository.getTask(
        occurrence.taskId,
      );

      if (task == null) {
        continue;
      }

      events.add(
        CalendarEvent(
          occurrenceId: occurrence.id.toString(),
          taskId: task.id.toString(),
          title: task.title,
          start: occurrence.occurrenceDate,
          end: occurrence.occurrenceDate,
          completed: occurrence.completed,
          priority: task.priority.index,
          categoryId: task.categoryId.toString(),
        ),
      );
    }

    events.sort(
      (a, b) => a.start.compareTo(b.start),
    );

    return events;
  }

  @override
  Future<void> refresh() async {}
}