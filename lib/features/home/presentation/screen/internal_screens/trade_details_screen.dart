import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:bombay_running/config/theme/text_styles.dart';
import 'package:bombay_running/core/utils/color_parser.dart';
import 'package:bombay_running/core/utils/double_formatter.dart';
import 'package:bombay_running/features/home/data/model/criteria_model.dart';
import 'package:bombay_running/features/home/data/model/stock_model.dart';
import 'package:bombay_running/features/home/data/model/variable_model.dart';
import 'package:bombay_running/features/home/domain/bloc/stock_details/stock_details_cubit.dart';
import 'package:bombay_running/features/home/presentation/screen/internal_screens/edit_indicator_screen.dart';
import 'package:bombay_running/features/home/presentation/screen/internal_screens/edit_value_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradeDetailsScreen extends StatefulWidget {
  final int stockIndex;

  const TradeDetailsScreen({super.key, required this.stockIndex});

  @override
  State<TradeDetailsScreen> createState() => _TradeDetailsScreenState();
}

class _TradeDetailsScreenState extends State<TradeDetailsScreen> {
  late final StockDetailsCubit _stockCubit;
  late Stock stock;

  @override
  void initState() {
    _stockCubit = context.read<StockDetailsCubit>();
    stock = _stockCubit.stockDataList[widget.stockIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          RouteHelper.pop(context);
          return Future.value(false);
        },
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: ColorConstants.blue,
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                    )
                  ]),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'and',
                          style: AppTextStyles.style10W,
                        ),
                      ),
                  itemCount: (stock.criteria ?? []).length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: stock.criteria?[index].type == "variable"
                            ? BlocBuilder<StockDetailsCubit, StockDetailsState>(
                                builder: (context, state) {
                                  stock = _stockCubit
                                      .stockDataList[widget.stockIndex];
                                  return _buildDynamicText(index);
                                },
                              )
                            : Text(
                                stock.criteria?[index].text ?? '',
                                style: AppTextStyles.style16W,
                              ),
                      )),
            )
          ],
        ));
  }

  Widget _buildDynamicText(int indexValue) {
    final Criteria criteria = stock.criteria![indexValue];
    final String displayText = criteria.text ?? '';
    final List<String> variableList = criteria.variableValue ?? [];
    final List<String?> separatedString =
        _splitStringWithDelimiters(displayText, variableList);

    final List<InlineSpan> widgetSpans = List.generate(
        separatedString.length,
        (index) => variableList.contains(separatedString[index] ?? '')
            ? _buildClickableSpanItem(
                criteria.variableProperties![separatedString[index]],
                separatedString[index],
                indexValue)
            : _buildTextSpanItem(separatedString[index] ?? ''));
    return Text.rich(
      TextSpan(
        children: widgetSpans,
      ),
      textDirection: TextDirection.ltr,
    );
  }

  WidgetSpan _buildClickableSpanItem(
      Variable? variable, String? variableKey, int criteriaIndex) {
    String defaultValue = variable?.type == 'indicator'
        ? (variable?.defaultValue).toString()
        : (variable?.values?[variable.selectedValueIndex ?? 0] ?? 0).toString();
    defaultValue = NumberFormatter.formatStringDouble(defaultValue);
    return WidgetSpan(
        child: InkWell(
      onTap: () {
        if (variable?.type == 'indicator') {
          RouteHelper.pushScreen(
              RouteHelper.marketScansContext,
              EditIndicatorScreen(
                  variable: variable,
                  callback: (defaultValue) {
                    final Variable newVariable =
                        variable!.copyWith(defaultValue: defaultValue);
                    _stockCubit.saveEditedValues(newVariable, variableKey ?? '',
                        widget.stockIndex, criteriaIndex);
                  }));
        } else if (variable?.type == 'value') {
          RouteHelper.pushScreen(
              RouteHelper.marketScansContext,
              EditValueScreen(
                  variable: variable,
                  callback: (valueIndex) {
                    final Variable newVariable =
                        variable!.copyWith(selectedValueIndex: valueIndex);
                    _stockCubit.saveEditedValues(newVariable, variableKey ?? '',
                        widget.stockIndex, criteriaIndex);
                  }));
        }
      },
      child: Text(
        '($defaultValue)',
        style: AppTextStyles.style16BU,
      ),
    ));
  }

  WidgetSpan _buildTextSpanItem(String text) {
    return WidgetSpan(
        child: Text(
      '$text ',
      style: AppTextStyles.style16W,
    ));
  }

  List<String> _splitStringWithDelimiters(
      String inputString, List<String> values) {
    final regexPattern = values.map((value) => RegExp.escape(value)).join('|');
    final matches = RegExp(regexPattern).allMatches(inputString);
    final splitList = <String>[];
    int startIndex = 0;
    for (final match in matches) {
      // Add the text before the captured group
      splitList.add(inputString.substring(startIndex, match.start));
      splitList.add(match.group(0) ?? '');
      startIndex = match.end;
    }

    // Add the remaining text after the last captured group
    if (startIndex < inputString.length) {
      splitList.add(inputString.substring(startIndex));
    }
    return splitList;
  }
}
