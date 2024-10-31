import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_page_model.dart';
import 'package:money_manager/base/base_page_state.dart';

class HomePageState extends BasePageState {
  double income;
  double expenses;
  double balance;

  HomePageState({
    required this.income,
    required this.expenses,
    required this.balance,
  });

  @override
  BasePageState updateState({bool? isLockedPage}) {
    throw UnimplementedError();
  }
}

class HomePageModel extends BasePageModel<HomePageState> {
  HomePageModel()
      : super(HomePageState(
          income: 7300000,
          expenses: 6700000,
          balance: 13350000,
        ));
}

final homePageProvider = StateNotifierProvider<HomePageModel, HomePageState>(
    (ref) => HomePageModel());
