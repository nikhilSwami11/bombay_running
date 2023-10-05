import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:bombay_running/config/theme/text_styles.dart';
import 'package:bombay_running/core/constants/globals.dart';
import 'package:bombay_running/core/utils/color_parser.dart';
import 'package:bombay_running/features/home/data/model/stock_model.dart';
import 'package:bombay_running/features/home/domain/bloc/stock_details/stock_details_cubit.dart';
import 'package:bombay_running/features/home/presentation/screen/internal_screens/trade_details_screen.dart';
import 'package:bombay_running/features/home/presentation/widgets/liner_dashed_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScanListPage extends StatelessWidget {
  const MarketScanListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailsCubit, StockDetailsState>(
      builder: (context, state) {
        if (state is StockDetailsData) {
          return Center(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                  onTap: () async {
                    Globals.isOnBaseScreen = false;
                    await RouteHelper.pushScreen(
                        RouteHelper.marketScansContext,
                        BlocProvider.value(
                            value: context.read<StockDetailsCubit>(),
                            child: TradeDetailsScreen(
                              stockIndex: index,
                            )));
                    Globals.isOnBaseScreen = true;
                  },
                  child: _buildItems(state.stocks[index])),
              itemCount: state.stocks.length,
              separatorBuilder: (context, index) => const DottedLineWidget(),
            ),
          );
        } else if (state is StockDetailsError) {
          return Center(
            child: Text(
              'something went wrong',
              style: AppTextStyles.style16W,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildItems(
    Stock stock,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stock.name ?? "",
            style: AppTextStyles.style16WU,
          ),
          Text(
            stock.tag ?? "",
            style: AppTextStyles.style10WU.copyWith(
                color: ColorsParser.instance
                    .getColorsFromString(stock.color ?? '')),
          )
        ],
      ),
    );
  }
}
