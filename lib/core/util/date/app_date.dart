import 'package:intl/intl.dart';

class DateFormatter {
  static String hourMinuteFormat(DateTime dateTime) => DateFormat('hh:mm a').format(dateTime);
}