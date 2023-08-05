import 'package:intl/intl.dart';

class DateFormatUtills {
  DateFormatUtills._privateConstructor();

  static final DateFormatUtills instance = DateFormatUtills._privateConstructor();

  String getFormattedDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final DateFormat formatter1 = DateFormat('hh:mm a');
    return '${formatter.format(dateTime)} At ${formatter1.format(dateTime)}';
  }

  String getBirthDateFormattedDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime);
  }
}
