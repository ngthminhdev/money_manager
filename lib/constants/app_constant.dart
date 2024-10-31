class AppConstant {
  static final AppConstant _appConstant = new AppConstant._internal();
  


  

  factory AppConstant() {
    return _appConstant;
  }
  AppConstant._internal();
}

final appConstant = AppConstant();