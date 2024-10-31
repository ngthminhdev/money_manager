import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/base/base_page_model.dart';
import 'package:money_manager/base/base_page_state.dart';
import 'package:money_manager/modules/home/home_page.dart';

class MainPageState extends BasePageState {
  List<Widget> listOfPages;
  int selectedIndex;

  MainPageState({
    required this.listOfPages,
    required this.selectedIndex,
    super.isLockedPage,
  });

  @override
  MainPageState updateState({
    List<Widget>? listOfPages,
    int? selectedIndex,
    bool? isLockedPage,
  }) {
    return MainPageState(
        listOfPages: listOfPages ?? this.listOfPages,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        isLockedPage: isLockedPage ?? this.isLockedPage,
  );
  }
}

class MainPageModel extends BasePageModel<MainPageState> {
  MainPageModel() : super(MainPageState(listOfPages: [
    HomePage(),
    HomePage(),
    HomePage(),
  ], selectedIndex: 1));
  late PageController pageController;
  
  void initPage() {
    pageController = PageController(initialPage: 1);
  }
  
  void disposePage() {
    pageController.dispose();
  }

  void onNavbarChange(int index) {
    updatePageState(() {
      state.selectedIndex = index;
    });
    pageController.animateToPage(state.selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}

final mainPageProvider = StateNotifierProvider<MainPageModel, MainPageState>(
    (ref) => MainPageModel());
