import 'package:drift/drift.dart';

class DBTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3, max: 36)();
  IntColumn get category => integer()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
}
