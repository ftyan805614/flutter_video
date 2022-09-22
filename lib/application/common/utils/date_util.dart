import 'package:intl/intl.dart';

String getFormateDateByDateTime(String patter, DateTime dateTime) {
  return DateFormat(patter).format(dateTime);
}

String getFormateDateByMilliseconds(String patter, int milliseconds) {
  return DateFormat(patter).format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
}
