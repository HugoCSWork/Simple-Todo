import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/database/database.dart';
import 'package:simple_todo/features/home/home_provider.dart';
import 'package:simple_todo/router/router.dart';

class Todo extends ConsumerWidget {
  final DBTask todo;
  const Todo(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = todo.completed ? 0.3 : 1.0;
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => context.pushNamed(RoutePaths.details, pathParameters: {"id": todo.id.toString()}),
                child: Row(
                  children: [
                    Opacity(
                      opacity: opacity,
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: CircleAvatar(backgroundColor: icon.$2, child: Icon(icon.$1)),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Opacity(
                      opacity: opacity,
                      child: Text(
                        todo.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: todo.completed ? TextDecoration.lineThrough : null),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: const BorderSide(color: Color(0xff4A3780), width: 1.5),
                value: todo.completed,
                onChanged: (val) => ref.read(updateTodoProvider(todo.copyWith(completed: val)).future),
              ),
            )
          ],
        ),
      ),
    );
  }

  (IconData, Color) get icon {
    switch (todo.category) {
      case 0:
        return (Icons.list_alt, const Color(0xffDBECF6));
      case 1:
        return (Icons.calendar_month, const Color(0xffE7E2F3));
      case 2:
        return (Icons.golf_course_sharp, const Color(0xffFEF5D3));
      default:
        return (Icons.question_mark, const Color(0xffDBECF6));
    }
  }
}
