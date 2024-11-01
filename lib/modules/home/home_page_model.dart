import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_page_model.dart';
import 'package:money_manager/base/base_page_state.dart';
import 'package:money_manager/constants/app_constant.dart';
import 'package:money_manager/helpers/date_helper.dart';
import 'package:money_manager/helpers/device_helper.dart';
import 'package:money_manager/modules/home/constants/home_constant.dart';

class HomePageState extends BasePageState {
  double income;
  double expenses;
  double balance;
  int selectedTab;
  String currentMonthYear;
  int currentMonth;
  int currentYear;

  HomePageState({
    required this.income,
    required this.expenses,
    required this.balance,
    required this.selectedTab,
    required this.currentMonthYear,
    required this.currentMonth,
    required this.currentYear,
    super.isLockedPage,
  });

  @override
  HomePageState updateState({
    bool? isLockedPage,
    double? income,
    double? expenses,
    double? balance,
    int? selectedTab,
    String? currentMonthYear,
    int? currentMonth,
    int? currentYear,
  }) {
    return HomePageState(
      isLockedPage: isLockedPage ?? this.isLockedPage,
      income: income ?? this.income,
      expenses: expenses ?? this.expenses,
      balance: balance ?? this.balance,
      selectedTab: selectedTab ?? this.selectedTab,
      currentMonthYear: currentMonthYear ?? this.currentMonthYear,
      currentMonth: currentMonth ?? this.currentMonth,
      currentYear: currentYear ?? this.currentYear,
    );
  }
}

class HomePageModel extends BasePageModel<HomePageState> {
  HomePageModel()
      : super(HomePageState(
          income: 7300000,
          expenses: 6700000,
          balance: 13350000,
          selectedTab: HomeConstant.LIST_TAB_INDEX,
          currentMonthYear: DateHelper.getMonthYearString(),
          currentMonth: DateTime.now().month,
          currentYear: DateTime.now().year,
        ));

  double getBodyHeight() {
    return deviceInfo.height -
        (deviceInfo.height * 0.3) -
        appConstant.NAVBAR_HEIGHT -
        appConstant.HEADER_HEIGHT;
  }

  void selectTab(int index) {
    if (index == state.selectedTab) return;
    updatePageState(() {
      state.selectedTab = index;
    });
  }

  void selectMonth(MonthSelect select) {
    DateTime currentSelectedDate =
        DateTime(state.currentYear, state.currentMonth, 1, 0, 0, 0);
    DateTime now = DateTime.now();

    int selectedDateInt = state.currentYear + state.currentMonth;
    selectedDateInt += (select == MonthSelect.next) ? 1 : -1;

    if (selectedDateInt > (now.year + now.month)) {
      return;
    }

    late DateTime newDate;
    if (select == MonthSelect.next) {
      newDate =
          DateTime(currentSelectedDate.year, currentSelectedDate.month + 1);
    } else {
      newDate =
          DateTime(currentSelectedDate.year, currentSelectedDate.month - 1);
    }
    updatePageState(() {
      state.currentMonth = newDate.month;
      state.currentYear = newDate.year;
      state.currentMonthYear = DateHelper.getMonthYearString(newDate);
    });
  }
}

final homePageProvider = StateNotifierProvider<HomePageModel, HomePageState>(
    (ref) => HomePageModel());
