import 'package:flutter/material.dart';

mixin RouteHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get navigatorContext => navigatorKey.currentContext!;

  static final GlobalKey<NavigatorState> marketScansKey =
      GlobalKey<NavigatorState>();

  static BuildContext get marketScansContext => marketScansKey.currentContext!;
  static BuildContext? initialMarketScanContext;

  static Future push(String routeName, BuildContext context, {Object? args}) {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushScreen(BuildContext context, Widget screen) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  static Future pushReplacement(String routeName, BuildContext context,
      {Object? args}) {
    return Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future pushAndPopUntil(
    String routeName,
    BuildContext context, {
    String? popUntilRouteName,
    Object? args,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      popUntilRouteName != null
          ? ModalRoute.withName(popUntilRouteName)
          : (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static bool canPop() {
    return Navigator.of(navigatorContext).canPop();
  }

  static Future<void> maybePop() {
    return Navigator.of(navigatorContext).maybePop();
  }

  static void popUntil(
    String routesName,
    BuildContext context,
  ) {
    Navigator.of(context).popUntil(ModalRoute.withName(routesName));
  }

  static Future<T?> openDialog<T>(
    Widget child, {
    bool isDismissible = true,
    Color barrierColor = Colors.black54,
  }) {
    return showDialog<T?>(
      context: navigatorContext,
      builder: (_) => child,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
    );
  }

  static Future<T?> openModalSheet<T>(
    Widget child, {
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T?>(
      context: navigatorContext,
      builder: (_) => child,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }
}
