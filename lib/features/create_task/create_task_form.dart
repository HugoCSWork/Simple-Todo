import 'package:flutter/material.dart';

class CreateTaskForm {
  final TextEditingController titleController;
  final TextEditingController categoryController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController notesController;

  CreateTaskForm({String title = '', String? category, String? date, String? time, String notes = ''})
      : titleController = TextEditingController(text: title),
        categoryController = TextEditingController(text: category),
        dateController = TextEditingController(text: date),
        timeController = TextEditingController(text: time),
        notesController = TextEditingController(text: notes);

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
