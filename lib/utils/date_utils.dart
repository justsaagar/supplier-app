import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getFormattedDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMMM, yyyy');
    return formatter.format(dateTime);
  }
}
