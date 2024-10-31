import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_state.dart';

class BasePageModel<S extends BasePageState> extends StateNotifier<S> {
  BasePageModel(super.state);

  void lockPage(bool lock) {
    state.isLockedPage = lock;
    state = state;
    // state = state.updateState(isLockedPage: lock);
  }
}