import 'package:bombay_running/config/routes/route_helper.dart';
import 'package:bombay_running/config/theme/color_constants.dart';
import 'package:bombay_running/config/theme/text_styles.dart';
import 'package:bombay_running/core/constants/string_constants.dart';
import 'package:bombay_running/core/utils/range_input_formatter.dart';
import 'package:bombay_running/features/home/data/model/variable_model.dart';
import 'package:flutter/material.dart';

class EditIndicatorScreen extends StatefulWidget {
  final Variable? variable;
  final Function(int) callback;
  const EditIndicatorScreen(
      {super.key, required this.variable, required this.callback});

  @override
  State<EditIndicatorScreen> createState() => _EditIndicatorScreenState();
}

class _EditIndicatorScreenState extends State<EditIndicatorScreen> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController(
        text: (widget.variable?.defaultValue ?? 0).toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (widget.variable?.studyType ?? '').toUpperCase(),
          style: AppTextStyles.style16W,
        ),
        const Text(
          StringConstants.setParameters,
          style: AppTextStyles.style14W,
        ),
        Container(
          height: 60,
          color: ColorConstants.white,
          padding: const EdgeInsets.all(10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.variable?.parameterName ?? '',
                  style: AppTextStyles.style14B,
                ),
                SizedBox(
                  width: 120,
                  height: 22,
                  child: TextField(
                    controller: _textEditingController,
                    inputFormatters: [
                      RangeInputFormatter(
                          minValue: widget.variable?.minValue ?? 0,
                          maxValue: widget.variable?.maxValue ?? 0)
                    ],
                    keyboardType: TextInputType.number,
                    style: AppTextStyles.style14B
                        .copyWith(color: ColorConstants.black),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 2, bottom: 2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
        const Spacer(),
        Center(
          child: TextButton(
            onPressed: () {
              RouteHelper.pop(context);
              widget.callback.call(int.parse(_textEditingController.text));
            },
            child: Text(
              StringConstants.saveValue,
              style: AppTextStyles.style16BU,
            ),
          ),
        )
      ],
    );
  }
}
