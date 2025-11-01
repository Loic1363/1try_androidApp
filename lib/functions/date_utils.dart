import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context, DateTime initialDate) {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
}


//String formattedTodayDate() {
//  final now = DateTime.now();
//  return DateFormat("EEEE d/M/yy", 'fr_FR').format(now);
//}