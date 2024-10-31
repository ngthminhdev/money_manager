import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/modules/main/main_page.dart';
import 'routes/router.dart' as route;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColors.dark),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: MainPage(),
      onGenerateRoute: route.Router.generateRoute,
    );
  }
}