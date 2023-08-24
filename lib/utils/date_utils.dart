import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getFormattedDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMMM, yyyy');
    return formatter.format(dateTime);
  }

  static String getNotificationTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yy, hh:mm a');
    return formatter.format(dateTime);
  }

  static String getStoreBirthDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}
