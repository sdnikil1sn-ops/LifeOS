import '../domain/recurrence_engine.dart';

class RecurrenceService {
  final RecurrenceEngine engine = RecurrenceEngine();

  Future<void> refreshOccurrences() async {
    // Will call OccurrenceGenerator in the next step.
  }
}