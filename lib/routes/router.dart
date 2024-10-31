import 'package:flutter/material.dart';
import 'package:money_manager/routes/routes_config.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    BaseRoute route = getRoute(settings.name)!;
    Widget? view = route.view!(settings: settings);

    return MaterialPageRoute(builder: (_) => view);
  }
}