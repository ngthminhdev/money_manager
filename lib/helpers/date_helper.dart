import 'package:intl/intl.dart';

class DateHelper {
  static String getMonthYearString([DateTime? now]) {
    DateTime currentDate = now ?? DateTime.now();
    String stringMonth = '';
    int selectedMonth = currentDate.month;

    switch (selectedMonth) {
      case 1:
        stringMonth = 'Tháng 1';
        break;
      case 2:
        stringMonth = 'Tháng 2';
        break;
      case 3:
        stringMonth = 'Tháng 3';
        break;
      case 4:
        stringMonth = 'Tháng 4';
        break;
      case 5:
        stringMonth = 'Tháng 5';
        break;
      case 6:
        stringMonth = 'Tháng 6';
        break;
      case 7:
        stringMonth = 'Tháng 7';
        break;
      case 8:
        stringMonth = 'Tháng 8';
        break;
      case 9:
        stringMonth = 'Tháng 9';
        break;
      case 10:
        stringMonth = 'Tháng 10';
        break;
      case 11:
        stringMonth = 'Tháng 11';
        break;
      case 12:
        stringMonth = 'Tháng 12';
        break;
    }
    return '$stringMonth - ${currentDate.year}';
  }

  static String format(String dateString, {bool includeTime = false}) {
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    String formattedDate = '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year.toString()}';

    if (includeTime) {
      formattedDate += ' ${dateTime.hour.toString().padLeft(2, '0')}:'
          '${dateTime.minute.toString().padLeft(2, '0')}';
    }

    return formattedDate;
  }

  static String formatWith(DateTime dateString, {String format = "yyyy-MM-dd"}) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(dateString);

    return formattedDate;
  }
}
