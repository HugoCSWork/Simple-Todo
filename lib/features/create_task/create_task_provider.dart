import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/database/database.dart';
import 'package:simple_todo/extensions/string_extensions.dart';
import 'package:simple_todo/features/create_task/create_task_form.dart';

final createTaskProvider = FutureProvider.family.autoDispose<void, CreateTaskForm>((ref, todo) async {
  final db = ref.read(databaseProvider);
  final date = todo.date.toDate;
  final time = todo.time.toTimeOfDay;

  db.into(db.dBTasks).insert(
        DBTasksCompanion.insert(
          title: todo.title,
          category: int.parse(todo.category),
          notes: Value(todo.notes),
          date: DateTime(date.year, date.month, date.day, time.hour, time.minute),
          createdAt: DateTime.now(),
        ),
      );
});
