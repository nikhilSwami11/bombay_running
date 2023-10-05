import 'package:bombay_running/config/routes/routes.dart';
import 'package:bombay_running/features/home/presentation/screen/home_screen.dart';
import 'package:bombay_running/features/home/presentation/screen/market_scan_list_page.dart';
import 'package:flutter/material.dart';

//ignore_for_file: cast_nullable_to_non_nullable
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    final Widget widget;
    switch (routeName) {
      case Routes.HOME_SCREEN:
        widget = const HomeScreen();
        break;
      case Routes.MARKET_SCAN_SCREEN:
        widget = const MarketScanListPage();
      default:
        widget = const SizedBox.shrink();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => widget,
      settings: RouteSettings(name: routeName),
    );
  }
}
