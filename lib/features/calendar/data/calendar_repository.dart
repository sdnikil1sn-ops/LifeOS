import '../domain/calendar_event.dart';

abstract class CalendarRepository {
  /// Returns every event occurring on the specified day.
  Future<List<CalendarEvent>> getEventsForDay(
    DateTime day,
  );

  /// Returns every event occurring inside the given month.
  Future<List<CalendarEvent>> getEventsForMonth(
    DateTime month,
  );

  /// Returns every event between two dates.
  Future<List<CalendarEvent>> getEventsBetween(
    DateTime from,
    DateTime to,
  );

  /// Reload cached data.
  Future<void> refresh();
}