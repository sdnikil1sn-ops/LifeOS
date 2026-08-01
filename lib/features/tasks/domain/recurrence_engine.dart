import '../../../database/enums/task_enums.dart';
import 'recurrence_rules.dart';

class RecurrenceEngine {
  final RecurrenceRules _rules = const RecurrenceRules();

  List<DateTime> generateOccurrences({
    required RepeatType repeatType,
    required DateTime start,
    required DateTime end,
    int customIntervalDays = 1,
  }) {
    final dates = <DateTime>[];

    DateTime? current = start;

    while (current != null && !current.isAfter(end)) {
      dates.add(current);

      current = _rules.nextOccurrence(
        repeatType: repeatType,
        current: current,
        customIntervalDays: customIntervalDays,
      );
    }

    return dates;
  }
}