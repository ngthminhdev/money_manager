import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:money_manager/constants/app_color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
            child: LoadingAnimationWidget.discreteCircle(
          size: 50,
          color: appColors.lime,
        )),
      ),
    );
  }
}
