import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/features/home/components/todos_list.dart';
import 'package:simple_todo/features/home/home_provider.dart';

class CompletedTodoList extends ConsumerWidget {
  const CompletedTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodos = ref.watch(completedTodosProvider);

    if (!completedTodos.hasValue || completedTodos.value!.isEmpty) {
      return const Flexible(child: SizedBox());
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Completed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 14),
            Flexible(child: TodosList(completedTodos.value!)),
          ],
        ),
      ),
    );
  }
}
