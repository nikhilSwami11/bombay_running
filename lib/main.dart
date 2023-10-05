import 'package:bombay_running/config/routes/route_generator.dart';
import 'package:bombay_running/config/routes/routes.dart';
import 'package:flutter/material.dart';

import 'config/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: RouteHelper.navigatorKey,
      title: 'bombay running',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.HOME_SCREEN,
    );
  }
}
