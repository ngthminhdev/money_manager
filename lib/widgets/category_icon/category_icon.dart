import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_color.dart';

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? color;
  final double? width;
  final double? height;
  final double? iconSize;

  const CategoryIcon(
      {required this.icon,
      this.iconColor = Colors.white,
      this.color,
      this.width = 55,
      this.height = 55,
      this.iconSize = 32,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Color finalColor = color ?? AppColor.randomColor();
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: finalColor,
        shape: BoxShape.circle
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
          fill: 1,
        ),
      ),
    );
  }
}
