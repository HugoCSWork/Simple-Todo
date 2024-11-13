import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  DateTime get toDate => DateFormat('dd-MM-yyyy').parse(this);

  TimeOfDay get toTimeOfDay {
    final parts = split(':');

    if (parts.length < 2) return const TimeOfDay(hour: 0, minute: 0);

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
