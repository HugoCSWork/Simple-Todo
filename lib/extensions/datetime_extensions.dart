import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo/extensions/time_of_day_extensions.dart';

extension DatetimeExtensions on DateTime {
  String get stringFormat => DateFormat('dd-MM-yyyy').format(this);

  String get timeOfDay => TimeOfDay(hour: hour, minute: minute).stringFormat;
}
