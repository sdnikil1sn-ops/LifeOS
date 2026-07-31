import 'package:drift/drift.dart';

import '../enums/task_enums.dart';

class RepeatTypeConverter extends TypeConverter<RepeatType, int> {
  const RepeatTypeConverter();

  @override
  RepeatType fromSql(int fromDb) => RepeatType.values[fromDb];

  @override
  int toSql(RepeatType value) => value.index;
}

class TaskPriorityConverter extends TypeConverter<TaskPriority, int> {
  const TaskPriorityConverter();

  @override
  TaskPriority fromSql(int fromDb) => TaskPriority.values[fromDb];

  @override
  int toSql(TaskPriority value) => value.index;
}

class TaskStatusConverter extends TypeConverter<TaskStatus, int> {
  const TaskStatusConverter();

  @override
  TaskStatus fromSql(int fromDb) => TaskStatus.values[fromDb];

  @override
  int toSql(TaskStatus value) => value.index;
}