import '../data/calendar_repository.dart';
import '../domain/calendar_event.dart';

class CalendarService {
  final CalendarRepository repository;

  CalendarService(this.repository);

  Future<List<CalendarEvent>> getEventsForDay(
    DateTime day,
  ) {
    return repository.getEventsForDay(day);
  }

  Future<List<CalendarEvent>> getEventsForMonth(
    DateTime month,
  ) {
    return repository.getEventsForMonth(month);
  }

  Future<List<CalendarEvent>> getEventsBetween(
    DateTime from,
    DateTime to,
  ) {
    return repository.getEventsBetween(
      from,
      to,
    );
  }

  Future<void> refreshCalendar() {
    return repository.refresh();
  }
}