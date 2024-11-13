import 'package:flutter/material.dart';
import 'package:simple_todo/database/database.dart';
import 'package:simple_todo/extensions/datetime_extensions.dart';

class TaskDetailsForm {
  final DBTask existingTask;
  final TextEditingController titleController;
  final TextEditingController categoryController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController notesController;

  TaskDetailsForm(this.existingTask)
      : titleController = TextEditingController(text: existingTask.title),
        categoryController = TextEditingController(text: existingTask.category.toString()),
        dateController = TextEditingController(text: existingTask.date.stringFormat),
        timeController = TextEditingController(text: existingTask.date.timeOfDay),
        notesController = TextEditingController(text: existingTask.notes);

  List<TextEditingController> get controllers => [
        titleController,
        categoryController,
        dateController,
        timeController,
        notesController,
      ];

  String get title => titleController.text;
  String get category => categoryController.text;
  String get date => dateController.text;
  String get time => timeController.text;
  String get notes => notesController.text;
}
