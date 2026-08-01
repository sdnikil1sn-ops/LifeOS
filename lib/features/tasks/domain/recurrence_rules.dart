import '../../../database/enums/task_enums.dart';

class RecurrenceRules {
  const RecurrenceRules();

  DateTime? nextOccurrence({
    required RepeatType repeatType,
    required DateTime current,
    int customIntervalDays = 1,
  }) {
    switch (repeatType) {
      case RepeatType.none:
        return null;

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
        return current.add(Duration(days: customIntervalDays));
    }
  }
}