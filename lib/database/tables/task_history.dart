import 'package:drift/drift.dart';

import '../converters/enum_converter.dart';
import 'tasks.dart';

class TaskHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get taskId =>
      integer().references(Tasks, #id)();

  DateTimeColumn get completedAt =>
      dateTime()();

  IntColumn get status =>
      integer().map(const TaskStatusConverter())();
}