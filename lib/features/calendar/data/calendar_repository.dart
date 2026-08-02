import '../domain/calendar_event.dart';

abstract class CalendarRepository {
  Future<List<CalendarEvent>> getEventsForDay(
    DateTime day,
  );

  Future<List<CalendarEvent>> getEventsForMonth(
    DateTime month,
  );

  Future<List<CalendarEvent>> getEventsBetween(
    DateTime from,
    DateTime to,
  );

  Future<void> refresh();
}