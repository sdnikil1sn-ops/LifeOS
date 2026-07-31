import 'package:drift/drift.dart';

import '../converters/enum_converter.dart';
import 'categories.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get categoryId =>
      integer().references(Categories, #id)();

  TextColumn get title => text()();

  TextColumn get description =>
      text().nullable()();

  IntColumn get priority =>
      integer().map(const TaskPriorityConverter())();

  IntColumn get repeatType =>
      integer().map(const RepeatTypeConverter())();

  DateTimeColumn get startDate =>
      dateTime().nullable()();

  DateTimeColumn get endDate =>
      dateTime().nullable()();

  IntColumn get reminderMinutes =>
      integer().nullable()();

  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}