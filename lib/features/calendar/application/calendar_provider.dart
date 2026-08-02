import 'package:flutter/foundation.dart';

import '../domain/calendar_event.dart';
import 'calendar_service.dart';

class CalendarProvider extends ChangeNotifier {
  final CalendarService service;

  CalendarProvider(this.service);

  DateTime _selectedDay = DateTime.now();

  List<CalendarEvent> _events = [];

  bool _loading = false;

  DateTime get selectedDay => _selectedDay;

  List<CalendarEvent> get events => _events;

  bool get loading => _loading;

  Future<void> loadDay(DateTime day) async {
    _loading = true;
    notifyListeners();

    _selectedDay = day;

    _events = await service.getEventsForDay(day);

    _loading = false;
    notifyListeners();
  }

  Future<void> loadMonth(DateTime month) async {
    _loading = true;
    notifyListeners();

    _events = await service.getEventsForMonth(month);

    _loading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadDay(_selectedDay);
  }

  void changeDay(DateTime day) {
    loadDay(day);
  }

  CalendarEvent? getEventByOccurrence(String occurrenceId) {
    try {
      return _events.firstWhere(
        (e) => e.occurrenceId == occurrenceId,
      );
    } catch (_) {
      return null;
    }
  }

  List<CalendarEvent> eventsForDate(DateTime date) {
    return _events.where((event) {
      return event.start.year == date.year &&
          event.start.month == date.month &&
          event.start.day == date.day;
    }).toList();
  }
}