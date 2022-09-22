import 'package:date_format/date_format.dart';

extension DateTimeExtension on DateTime {
  /// 是否同一年
  bool isSameYear(DateTime date) {
    String date1 = formatDate(date, [yyyy]);
    String date2 = formatDate(this, [yyyy]);
    return date1 == date2;
  }

  ///是否是同一天
  bool isSameDay(DateTime date) {
    String date1 = formatDate(date, [yyyy, '-', mm, '-', dd]);
    String date2 = formatDate(this, [yyyy, '-', mm, '-', dd]);
    return date1 == date2;
  }
}
