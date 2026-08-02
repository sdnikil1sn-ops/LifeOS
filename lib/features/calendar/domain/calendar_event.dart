class CalendarEvent {
  final String occurrenceId;
  final String taskId;

  final String title;

  final DateTime start;
  final DateTime end;

  final bool completed;

  final int priority;

  final String categoryId;

  const CalendarEvent({
    required this.occurrenceId,
    required this.taskId,
    required this.title,
    required this.start,
    required this.end,
    required this.completed,
    required this.priority,
    required this.categoryId,
  });
}