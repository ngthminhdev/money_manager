import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePageState extends StateNotifier {
  bool isLockedPage = false;

  BasePageState({this.isLockedPage = false }) : super(isLockedPage);

  BasePageState updateState({bool? isLockedPage}) {
    return BasePageState(isLockedPage: isLockedPage ?? this.isLockedPage);
  }
}
