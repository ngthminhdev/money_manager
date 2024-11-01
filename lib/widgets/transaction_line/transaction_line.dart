import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/helpers/number_helper.dart';
import 'package:money_manager/widgets/category_icon/category_icon.dart';

class TransactionLine extends StatelessWidget {
  final IconData icon;
  final double amount;
  const TransactionLine({super.key, required this.icon, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CategoryIcon(icon: icon),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đồ đi chợ nấu ăn',
                    style: TextStyle(
                        color: appColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Đây là một đoạn note dài thòng lòng',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appColors.white,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${amount < 0 ? '-' : '+'}${NumberHelper.currencyFormat(amount.abs())}",
                style: TextStyle(
                    color: amount < 0 ? appColors.orange : appColors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '01/11/2024',
                style: TextStyle(
                  color: appColors.white,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
