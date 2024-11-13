import 'package:flutter/material.dart';
import 'package:simple_todo/database/database.dart';
import 'package:simple_todo/features/home/components/todo.dart';

class TodosList extends StatelessWidget {
  final List<DBTask> todos;
  const TodosList(this.todos, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.white,
        elevation: 3,
        shadowColor: const Color(0xffE7E2F3),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return Todo(todo);
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey.shade300, height: 2);
          },
          itemCount: todos.length,
        ),
      ),
    );
  }
}
