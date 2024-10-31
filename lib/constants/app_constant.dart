class AppConstant {
  static final AppConstant _appConstant = new AppConstant._internal();
  
  double DEFAULT_PADDING = 8; 


  

  factory AppConstant() {
    return _appConstant;
  }
  AppConstant._internal();
}

final appConstant = AppConstant();