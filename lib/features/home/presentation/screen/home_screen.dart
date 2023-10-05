import 'package:bombay_running/config/routes/internal_routing_widget.dart';
import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:bombay_running/config/routes/routes.dart';
import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:bombay_running/core/constants/globals.dart';
import 'package:bombay_running/features/home/domain/bloc/stock_details/stock_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Globals.isOnBaseScreen) {
          return Future.value(true);
        } else {
          RouteHelper.pop(RouteHelper.marketScansContext);
          return Future.value(false);
        }
      },
      child: BlocProvider(
        create: (context) => StockDetailsCubit()..getStockDetails(),
        child: Scaffold(
          backgroundColor: ColorConstants.white,
          appBar: AppBar(
            backgroundColor: ColorConstants.white,
          ),
          body: Container(
              height: 320,
              color: ColorConstants.black,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              child: InternalRoutingWidget(
                initialRouting: Routes.MARKET_SCAN_SCREEN,
                navigatorKey: RouteHelper.marketScansKey,
              )),
        ),
      ),
    );
  }
}
