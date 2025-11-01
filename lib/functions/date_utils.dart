import 'package:intl/intl.dart';

String formattedTodayDate() {
  final now = DateTime.now();
  return DateFormat("EEEE d/M/yy", 'fr_FR').format(now);
}
