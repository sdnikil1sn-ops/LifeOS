import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'enums/task_enums.dart';
import 'converters/enum_converter.dart';

import 'tables/categories.dart';
import 'tables/tasks.dart';
import 'tables/task_occurrences.dart';
import 'tables/task_history.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    Tasks,
    TaskOccurrences,
    TaskHistory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(dir.path, 'lifeos.db'),
    );
    return NativeDatabase(file);
  });
}