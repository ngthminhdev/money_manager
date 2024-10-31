import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:money_manager/base/base_page.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/helpers/number_helper.dart';
import 'package:money_manager/modules/home/home_page_model.dart';
import 'package:money_manager/widgets/loading/loading_widget.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends BasePage<HomePageModel, HomePageState> {
  HomePage({super.key}) : super(provider: homePageProvider);
  
  @override
  ConsumerState<BasePage<HomePageModel, HomePageState>> createState() => _HomePageState();
}

class _HomePageState extends BasePageConsumerState<HomePageModel, HomePageState> {

  @override
  Widget renderPage(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: read.isLockedPage,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context));
  }
  
  Widget buildBody(BuildContext context,) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: appColors.black,
          body: Container(
        child: Column(
          children: [
            buildTopSection(context),
          ],
        ),
      )),
    );
  }

  Container buildTopSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [appColors.gradientGreen, appColors.gradientBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        children: [
          buildHeader(),
          const SizedBox(
            height: 20,
          ),
          buildMoneySection(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('list tab');
                },
                child: Container(
                alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Text(
                    'LIST',
                    style: TextStyle(color: appColors.white, fontWeight: FontWeight.bold),
                    ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('categories tab');
                },
                child: Container(
                alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.lime,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Text(
                    'CATEGORIES',
                    style: TextStyle(color: appColors.white, fontWeight: FontWeight.bold),
                    ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row buildMoneySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money_outlined, color: appColors.green, size: 16,),
                  Text(
                    NumberHelper.formatNumber(read.income),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appColors.green,
                    ),
                  ),
                ],
              ),
              Text(
                'INCOME',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: appColors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 35,
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1, color: appColors.white)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money_outlined, color: appColors.orange, size: 16,),
                  Text(
                    NumberHelper.formatNumber(read.expenses),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appColors.orange,
                    ),
                  ),
                ],
              ),
              Text(
                'EXPENSES',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: appColors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 35,
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1, color: appColors.white)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money_outlined, color: appColors.yellow, size: 16,),
                  Text(
                    NumberHelper.formatNumber(read.balance),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appColors.yellow,
                    ),
                  ),
                ],
              ),
              Text(
                'BALANCE',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: appColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildHeader() {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Remix.menu_fill,
                    color: appColors.white,
                  )),
            )),
        Expanded(
            flex: 8,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Thanh Minh",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: appColors.white,
                ),
              ),
            ))
      ],
    );
  }
}