import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo/features/home/components/completed_todo_list.dart';
import 'package:simple_todo/features/home/components/incomplete_todo_list.dart';
import 'package:simple_todo/router/router.dart';
import 'package:simple_todo/shared/styled_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff4A3870),
        toolbarHeight: 40,
        title: Text(DateFormat('MMMM d, y').format(DateTime.now()),
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                color: const Color(0xff4A3870),
                height: 80,
                child: const Center(
                  child: Text("My Todo List",
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              const IncompleteTodoList(),
              const CompletedTodoList(),
            ],
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: StyledButton(onPressed: () => context.pushNamed(RoutePaths.create), text: 'Add New Task'),
            ),
          ),
        ],
      ),
    );
  }
}
