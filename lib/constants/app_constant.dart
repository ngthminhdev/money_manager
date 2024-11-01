import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class AppConstant {
  static final AppConstant _appConstant = new AppConstant._internal();
  static const apiHost = '';
  
  double DEFAULT_PADDING = 8; 
  double NAVBAR_HEIGHT = 80;
  double HEADER_HEIGHT = 50;
  
  static const Map<int, IconData> categoryIconMap = {
    0: Remix.home_3_fill, // Nhà cửa
    1: Remix.restaurant_fill, // Đồ đi chợ nấu ăn
    2: Icons.ramen_dining, // Các bữa ăn uống bên ngoài
    3: Remix.drinks_2_fill, // Uống các thứ (cafe, trà sữa..)
    4: Remix.motorbike_fill, // Xe cộ, đi lại
    5: Remix.capsule_fill, // Đau ốm
    6: Remix.beer_fill, // Đám tiệc
    7: Remix.exchange_dollar_line, // Trả nợ - Trả góp các thứ
    8: Remix.shake_hands_fill, // Các mối quan hệ
    9: Remix.book_2_fill, // Học tập
    10: Remix.bank_fill, // Tiết kiệm
    11: Remix.smartphone_line, // Thiết bị - điện tử
    12: Remix.shopping_bag_4_fill, // Mua sắm
    13: Remix.tools_fill, // Tools
    14: Remix.funds_fill, // Đầu tư
    15: Remix.more_fill, // Khác
    16: Icons.pets, // Pet,
    17: Icons.wine_bar, // Di choi
    18: Remix.hearts_fill,
    19: Remix.refund_fill, // Luong
  };

  
  

  factory AppConstant() {
    return _appConstant;
  }
  AppConstant._internal();
}

final appConstant = AppConstant();