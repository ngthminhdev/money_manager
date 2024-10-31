import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_page_model.dart';
import 'package:money_manager/base/base_page_state.dart';

class HomePageState extends BasePageState {
  double income;
  double expenses;
  double balance;
  int selectedTab;

  HomePageState({
    required this.income,
    required this.expenses,
    required this.balance,
    required this.selectedTab,
    super.isLockedPage,
  });

  @override
  HomePageState updateState({
    bool? isLockedPage,
    double? income,
    double? expenses,
    double? balance,
    int? selectedTab,
  }) {
    return HomePageState(
      income: income ?? this.income,
      expenses: expenses ?? this.expenses,
      balance: balance ?? this.balance,
      selectedTab: selectedTab ?? this.selectedTab,
      isLockedPage: isLockedPage ?? this.isLockedPage,
    );
  }
}

class HomePageModel extends BasePageModel<HomePageState> {
  HomePageModel()
      : super(HomePageState(
          income: 7300000,
          expenses: 6700000,
          balance: 13350000,
          selectedTab: 0
        ));

  void selectTab(int index) {
    if (index == state.selectedTab) return;
    updatePageState(() {
      state.selectedTab = index;
    });
  }

  
}

final homePageProvider = StateNotifierProvider<HomePageModel, HomePageState>(
    (ref) => HomePageModel());
