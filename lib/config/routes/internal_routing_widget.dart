import 'package:bombay_running/config/routes/route_generator.dart';
import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:flutter/material.dart';

///[InternalRoutingWidget] Internal routing widget will create routing within a widget
/// To do internal routing
/// {1} create a [navigatorKey] inside [RouteHelper]
/// {2} list all the screen in switch cases which will be part of this internal routing
/// {3} While Routing in internal routing you must give context in [RouteHelper] Methods like push,pod
/// {4} The RouteHelper will automatically detect if it's global or internal routing.
class InternalRoutingWidget extends StatelessWidget {
  const InternalRoutingWidget({
    super.key,
    required this.navigatorKey,
    required this.initialRouting,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  final String initialRouting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Navigator(
        key: navigatorKey,
        initialRoute: initialRouting,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
