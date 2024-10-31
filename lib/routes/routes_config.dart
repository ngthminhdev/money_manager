import 'package:flutter/material.dart';
import 'package:money_manager/modules/home/home_page.dart';

class RouteNames {
  static const String main = 'main';
  static const String home = 'home';
}

class RouteCreator {
  static Map<String, dynamic> routes = {
    RouteNames.main: BaseRoute(RouteNames.main, 'main',
        view: ({settings, params}) => HomePage()),
    RouteNames.home: BaseRoute(RouteNames.home, 'home',
        view: ({settings, params}) => HomePage()),
  };
}

class BaseRoute {
  final String routeName;
  final String routeTitle;
  final Widget Function({
    RouteSettings? settings,
    Map<String, String>? params,
  })? view;

  BaseRoute(this.routeName, this.routeTitle, {this.view});
}

BaseRoute? Function(String?) getRoute = (String? routeName) {
  return RouteCreator.routes[routeName];
};