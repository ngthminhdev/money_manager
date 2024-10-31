class BasePageState {
  bool isLockedPage = false;

  BasePageState({this.isLockedPage = false });

  BasePageState updateState({bool? isLockedPage}) {
    return BasePageState(isLockedPage: isLockedPage ?? this.isLockedPage);
  }
}
