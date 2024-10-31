import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class NumberHelper {
  static String removeTrailingZero(String string) {
    if (!string.contains(',')) {
      return string;
    }
    string = string.replaceAll(RegExp(r'0*$'), '');
    if (string.endsWith(',')) {
      string = string.substring(0, string.length - 1);
    }
    // RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
    return string;
  }
   static String formatNumber(double number) {
   if (number == number.floor()) {
    // Xử lý số nguyên, sử dụng dấu chấm làm dấu phân cách hàng ngàn
    var formatter = NumberFormat("#,###", "en_US");
    return formatter.format(number).replaceAll(",", ".");
  } else {
    // Xử lý số thập phân, làm tròn đến 3 chữ số thập phân
    var parts = number.toStringAsFixed(3).split('.');
    var integerPart = int.parse(parts[0]);
    var decimalPart = parts[1];

    // Xóa các số 0 thừa ở cuối phần thập phân
    decimalPart = decimalPart.replaceAll(RegExp(r'0+$'), '');

    // Nếu không còn phần thập phân, chỉ trả về phần nguyên
    if (decimalPart.isEmpty) {
      var formatter = NumberFormat("#,###", "en_US");
      return formatter.format(integerPart).replaceAll(",", ".");
    }

    // Định dạng phần nguyên với dấu chấm
    var formatter = NumberFormat("#,###", "en_US");
    String formattedInt = formatter.format(integerPart).replaceAll(",", ".");

    return "$formattedInt,$decimalPart";
  }
  }

  static String currencyFormat(
    double? number, {
    String? type = "withoutFractionDigits",
  }) {
    if (number == null) return '0';
    MoneyFormatter fmf;
    if (type == "nonSymbol") {
      fmf = MoneyFormatter(amount: number, settings: MoneyFormatterSettings(decimalSeparator: ',', thousandSeparator: '.', fractionDigits: 3));
      return NumberHelper.removeTrailingZero(fmf.output.nonSymbol);
    }
    fmf = MoneyFormatter(amount: number, settings: MoneyFormatterSettings(decimalSeparator: ',', thousandSeparator: '.'));
    return fmf.output.withoutFractionDigits;
  }

  static removeSpecialCharactorOnString(String numberString) {
    return numberString.replaceAll(',', '');
  }

  static currencyFormatFromString(
    String? number, {
    String? type = "withoutFractionDigits",
  }) {
    if (number == null || number == '') return '0';
    number = NumberHelper.removeSpecialCharactorOnString(number);
    try {
      return NumberHelper.currencyFormat(double.parse(number!), type: type);
    } catch (error) {
      return '';
    }
  }

  static bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  static String addZeroBeforeNumber(int number) {
    if (number < 10) return "0$number";
    return number.toString();
  }
  
  static String convertCurrency(double number) {
    int million = number ~/ 1000000;
    int thousand = number ~/ 100000;
    String result = '';

    if (million > 0) {
      result += '$million tr';
    }
    
    if (thousand > 0) {
      result += '$thousand ng';
    }

    return result;
  }
}
