import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/database/database.dart';
import 'package:simple_todo/extensions/string_extensions.dart';
import 'package:simple_todo/features/task_details/task_details_form.dart';

final getIndividualTaskProvider = FutureProvider.autoDispose.family<DBTask, int>((ref, id) async {
  final db = ref.watch(databaseProvider);

  final task = await db.getTaskById(id);

  if (task == null) {
    throw Exception("Task does not exist");
  }

  return task;
});

final updateTodoByFormProvider = FutureProvider.autoDispose.family<void, TaskDetailsForm>((ref, task) async {
  final db = ref.read(databaseProvider);
  final date = task.date.toDate;
  final time = task.time.toTimeOfDay;

  await db.update(db.dBTasks).replace(
        DBTask(
          id: task.existingTask.id,
          title: task.title,
          notes: task.notes,
          category: int.parse(task.category),
          date: DateTime(date.year, date.month, date.day, time.hour, time.minute),
          createdAt: task.existingTask.createdAt,
          completed: task.existingTask.completed,
        ),
      );
});
