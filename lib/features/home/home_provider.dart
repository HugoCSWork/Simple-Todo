import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/database/database.dart';

final incompleteTodosProvider = StreamProvider<List<DBTask>>((ref) async* {
  final db = ref.watch(databaseProvider);

  yield* db.managers.dBTasks.filter((f) => f.completed(false)).watch();
});

final completedTodosProvider = StreamProvider<List<DBTask>>((ref) async* {
  final db = ref.watch(databaseProvider);

  yield* db.managers.dBTasks.filter((f) => f.completed(true)).watch();
});

final updateTodoProvider = FutureProvider.autoDispose.family<void, DBTask>((ref, task) async {
  final db = ref.read(databaseProvider);

  await db.update(db.dBTasks).replace(task);
});
