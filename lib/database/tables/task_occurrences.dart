import 'package:drift/drift.dart';

import 'tasks.dart';

class TaskOccurrences extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get taskId =>
      integer().references(Tasks, #id)();

  DateTimeColumn get occurrenceDate =>
      dateTime()();

  BoolColumn get completed =>
      boolean().withDefault(const Constant(false))();
}