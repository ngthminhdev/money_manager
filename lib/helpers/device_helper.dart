import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:money_manager/models/device_model.dart';

class DeviceInfo {
  static final DeviceInfo _instance = DeviceInfo._internal();

  late BuildContext _context;
  late double width;
  late double height;
  late TextScaler textScaler;

  void init(BuildContext context) {
    _context = context;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
    textScaler = mediaQuery.textScaler;
  }

  BuildContext get context => _context;

  Future<DeviceModel> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Theme.of(context).platform == TargetPlatform.android) {
      final androidInfo = await deviceInfo.androidInfo;
      return DeviceModel.fromAndroid(androidInfo);
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return DeviceModel.fromIOS(iosInfo);
    } else {
      return DeviceModel();
    }
  }

  factory DeviceInfo() {
    return _instance;
  } 
  DeviceInfo._internal();
}

 
final deviceInfo = DeviceInfo();