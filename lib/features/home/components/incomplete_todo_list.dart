import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/features/home/components/todos_list.dart';
import 'package:simple_todo/features/home/home_provider.dart';

class IncompleteTodoList extends ConsumerWidget {
  const IncompleteTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incompleteTodos = ref.watch(incompleteTodosProvider);

    if (!incompleteTodos.hasValue || incompleteTodos.value!.isEmpty) {
      return Flexible(
        child: Container(
          color: const Color(0xff4A3870),
          height: 80,
          width: double.infinity,
        ),
      );
    }

    return Flexible(
      child: Stack(
        children: [
          Container(
            color: const Color(0xff4A3870),
            height: 80,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: TodosList(incompleteTodos.value!),
          ),
        ],
      ),
    );
  }
}
