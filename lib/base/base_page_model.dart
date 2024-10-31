import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_page_state.dart';

class BasePageModel<S extends BasePageState> extends StateNotifier<S> {
  BasePageModel(super.state);

  void lock(bool lock) {
    state = state.updateState(isLockedPage: lock) as S;
  }
  
  void updatePageState(VoidCallback fn) {
    fn();
    state = state.updateState() as S;
  }
}