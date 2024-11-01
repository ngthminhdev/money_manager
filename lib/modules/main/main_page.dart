import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money_manager/base/base_page.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/modules/main/main_page_model.dart';
import 'package:money_manager/widgets/loading/loading_widget.dart';
import 'package:money_manager/widgets/nav_bar/nav_bar.dart';
import 'package:remixicon/remixicon.dart';

class MainPage extends BasePage<MainPageModel, MainPageState> {
  MainPage({super.key}) : super(provider: mainPageProvider);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState
    extends BasePageConsumerState<MainPageModel, MainPageState> {
  @override
  Widget renderPage(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: read.isLockedPage,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context));
  }

  @override
  void initState() {
    pageModel.initPage();
    super.initState();
  }

  @override
  void dispose() {
    pageModel.disposePage();
    super.dispose();
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.black,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appColors.gradientGreen, appColors.gradientBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              alignment: Alignment.center,
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Remix.menu_fill,
                        color: appColors.white,
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nguyễn Thanh Minh",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: appColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageModel.pageController,
                children: read.listOfPages,
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildNavbar(),
      ),
    );
  }

  NavBar _buildNavbar() {
    return NavBar(
      backgroundColor: appColors.gray,
      onButtonPressed: pageModel.onNavbarChange,
      iconSize: 30,
      fontSize: 14,
      activeColor: appColors.green,
      inactiveColor: appColors.white,
      selectedIndex: read.selectedIndex,
      barItems: <BarItem>[
        BarItem(
          icon: Remix.exchange_fill,
          title: 'Giao dịch',
        ),
        BarItem(
          icon: Remix.exchange_dollar_fill,
          title: 'Ngân sách',
        ),
        BarItem(
          icon: Remix.layout_4_fill,
          title: 'Khác',
        ),
      ],
    );
  }
}
