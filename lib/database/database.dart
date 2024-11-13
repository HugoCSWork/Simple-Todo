import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/database/db_tasks.dart';

part 'database.g.dart';

final databaseProvider = Provider((ref) => AppDatabase());

@DriftDatabase(tables: [DBTasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() => driftDatabase(name: 'simple_todo');

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.addColumn(dBTasks, dBTasks.notes);
          }
        },
      );

  Future<DBTask?> getTaskById(int id) async {
    final task = await (select(dBTasks)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return task;
  }
}
