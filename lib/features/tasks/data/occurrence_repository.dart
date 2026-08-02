import 'package:drift/drift.dart';

import '../../../database/database.dart';

class OccurrenceRepository {
  final AppDatabase database;

  OccurrenceRepository(this.database);

  Future<List<TaskOccurrence>> getOccurrencesBetween(
    DateTime from,
    DateTime to,
  ) {
    return (database.select(database.taskOccurrences)
          ..where((tbl) =>
              tbl.occurrenceDate.isBiggerOrEqualValue(from) &
              tbl.occurrenceDate.isSmallerOrEqualValue(to)))
        .get();
  }

  Stream<List<TaskOccurrence>> watchOccurrencesBetween(
    DateTime from,
    DateTime to,
  ) {
    return (database.select(database.taskOccurrences)
          ..where((tbl) =>
              tbl.occurrenceDate.isBiggerOrEqualValue(from) &
              tbl.occurrenceDate.isSmallerOrEqualValue(to)))
        .watch();
  }

  Future<void> insertOccurrence(
    TaskOccurrencesCompanion occurrence,
  ) {
    return database
        .into(database.taskOccurrences)
        .insert(occurrence);
  }

  Future<void> deleteOccurrencesForTask(
    int taskId,
  ) {
    return (database.delete(database.taskOccurrences)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
  }

  Future<void> markCompleted(
    int occurrenceId,
    bool completed,
  ) {
    return (database.update(database.taskOccurrences)
          ..where((tbl) => tbl.id.equals(occurrenceId)))
        .write(
      TaskOccurrencesCompanion(
        completed: Value(completed),
      ),
    );
  }
}