import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppColor {
  static final AppColor _appColor = new AppColor._internal();

  Color lime = HexColor.fromHex("#08d2a9");
  Color black = HexColor.fromHex("#000000");
  Color dark = HexColor.fromHex("#101010");
  Color gray = HexColor.fromHex("#282828");
  Color white = HexColor.fromHex("#FFFFFF");
  Color orange = HexColor.fromHex('#fa7248');
  Color green = HexColor.fromHex("#3fd6b1");
  Color yellow = HexColor.fromHex('#f9da89');
  Color red = HexColor.fromHex("#CF2F2F");

  Color gradientGreen = HexColor.fromHex("#069b88");
  Color gradientBlue = HexColor.fromHex("#083fb4");

  fromHex(String color) {
    return HexColor.fromHex(color);
  }

  static Color randomColor() {
    final String hex = RandomColor.getColor(
        Options(format: Format.hex, luminosity: Luminosity.dark));
    final Color randomColor = HexColor.fromHex(hex);
    return randomColor;
  }

  factory AppColor() {
    return _appColor;
  }
  AppColor._internal();
}

final appColors = AppColor();
