import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money_manager/base/base_page.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/helpers/device_helper.dart';
import 'package:money_manager/helpers/number_helper.dart';
import 'package:money_manager/modules/home/constants/home_constant.dart';
import 'package:money_manager/modules/home/home_page_model.dart';
import 'package:money_manager/widgets/loading/loading_widget.dart';
import 'package:money_manager/widgets/transaction_line/transaction_line.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends BasePage<HomePageModel, HomePageState> {
  HomePage({super.key}) : super(provider: homePageProvider);

  @override
  ConsumerState<BasePage<HomePageModel, HomePageState>> createState() =>
      _HomePageState();
}

class _HomePageState
    extends BasePageConsumerState<HomePageModel, HomePageState> {
  @override
  Widget renderPage(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: read.isLockedPage,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: appColors.black,
          body: Column(
            children: [
              buildTopSection(context),
              SizedBox(
                height: pageModel.getBodyHeight(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildTransactionsSection(),
                      buildTransactionsSection()
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Column buildTransactionsSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            'HÔM NAY',
            style: TextStyle(fontSize: 16, color: appColors.white),
          ),
        ),
        Container(
          color: appColors.dark,
          child: Column(
            children: [
              TransactionLine(amount: 500000, icon: Remix.exchange_dollar_fill),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  color: appColors.gray,
                  thickness: 1,
                ),
              ),
              TransactionLine(
                  amount: -119000, icon: Remix.exchange_dollar_fill),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  color: appColors.gray,
                  thickness: 1,
                ),
              ),
              TransactionLine(amount: 250000, icon: Remix.exchange_dollar_fill),
            ],
          ),
        )
      ],
    );
  }

  Container buildTopSection(BuildContext context) {
    return Container(
      height: deviceInfo.height * 0.25,
      padding: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [appColors.gradientGreen, appColors.gradientBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /**
           * TAB SELECT SECTION
           */

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: appColors.green,
                          size: 16,
                        ),
                        Text(
                          NumberHelper.formatNumber(read.income),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: appColors.green,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'THU',
                      style: TextStyle(
                        fontSize: 15,
                        color: appColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1, color: appColors.white)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: appColors.orange,
                          size: 16,
                        ),
                        Text(
                          NumberHelper.formatNumber(read.expenses),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: appColors.orange,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'CHI',
                      style: TextStyle(
                        fontSize: 15,
                        color: appColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1, color: appColors.white)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: appColors.yellow,
                          size: 16,
                        ),
                        Text(
                          NumberHelper.formatNumber(read.balance),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: appColors.yellow,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'CÒN LẠI',
                      style: TextStyle(
                        fontSize: 15,
                        color: appColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /**
           * DATE SELECT SECTION
           */

          const SizedBox(
            height: 24,
          ),
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: read.selectedTab == HomeConstant.LIST_TAB_INDEX
                    ? deviceInfo.width * 0.1
                    : deviceInfo.width * 0.5,
                right: read.selectedTab == HomeConstant.LIST_TAB_INDEX
                    ? deviceInfo.width * 0.5
                    : deviceInfo.width * 0.1,
                child: Container(
                  width: deviceInfo.width * 0.4,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.lime,
                    borderRadius: read.selectedTab == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))
                        : const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      pageModel.selectTab(HomeConstant.LIST_TAB_INDEX);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: deviceInfo.width * 0.4,
                      height: 30,
                      decoration: BoxDecoration(
                          color: appColors.white.withAlpha(32),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Text(
                        'DANH SÁCH',
                        style: TextStyle(
                            color: appColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pageModel.selectTab(HomeConstant.CATEGORIES_TAB_INDEX);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: deviceInfo.width * 0.4,
                      height: 30,
                      decoration: BoxDecoration(
                          color: appColors.white.withAlpha(32),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text(
                        'DANH MỤC',
                        style: TextStyle(
                            color: appColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: deviceInfo.width,
            color: appColors.white.withOpacity(0.2),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceInfo.width * 0.1,
                        child: Center(
                          child: Icon(
                            Remix.arrow_left_s_line,
                            color: appColors.white,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            read.currentMonthYear,
                            style: TextStyle(
                              color: appColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '3 giao dịch',
                            style: TextStyle(
                              color: appColors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: deviceInfo.width * 0.1,
                        child: Center(
                          child: Icon(
                            Remix.arrow_right_s_line,
                            color: appColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    children: [
                      SizedBox(
                        width: deviceInfo.width * 0.5,
                        child: Material(
                          elevation: 1,
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: InkWell(
                            hoverColor: appColors.lime,
                            onTap: () {
                              pageModel.selectMonth(MonthSelect.previous);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: deviceInfo.width * 0.5,
                        child: Material(
                          elevation: 1,
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              pageModel.selectMonth(MonthSelect.next);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
