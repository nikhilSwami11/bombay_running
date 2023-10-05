import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:bombay_running/config/theme/text_styles.dart';
import 'package:bombay_running/core/constants/string_constants.dart';
import 'package:bombay_running/core/utils/double_formatter.dart';
import 'package:bombay_running/features/home/data/model/variable_model.dart';
import 'package:bombay_running/features/home/domain/bloc/edit_stocks/edit_stocks_cubit.dart';
import 'package:bombay_running/features/home/presentation/widgets/liner_dashed_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditValueScreen extends StatelessWidget {
  final Variable? variable;
  final Function(int) callback;
  const EditValueScreen({
    super.key,
    required this.variable,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditStocksCubit(index: variable?.selectedValueIndex ?? 0),
      child: BlocBuilder<EditStocksCubit, EditStocksState>(
        builder: (context, state) {
          if (state is EditStocksData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            context
                                .read<EditStocksCubit>()
                                .toggleSelectedValue(index);
                          },
                          child: ColoredBox(
                            color: state.currentIndex == index
                                ? ColorConstants.blue
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                NumberFormatter.formatStringDouble(
                                    variable!.values![index].toString()),
                                style: AppTextStyles.style16W,
                              ),
                            ),
                          )),
                      separatorBuilder: (_, __) => const DottedLineWidget(),
                      itemCount: variable!.values!.length),
                ),
                TextButton(
                  onPressed: () {
                    RouteHelper.pop(context);
                    callback.call(state.currentIndex);
                  },
                  child: Text(
                    StringConstants.saveValue,
                    style: AppTextStyles.style16BU,
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
