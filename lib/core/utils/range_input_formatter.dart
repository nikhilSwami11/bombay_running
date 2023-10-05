import 'package:flutter/services.dart';

class RangeInputFormatter extends TextInputFormatter {
  final int minValue;
  final int maxValue;
  RangeInputFormatter({required this.minValue, required this.maxValue});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int enteredValue = int.tryParse(newValue.text) ?? 0;

    if (enteredValue < minValue) {
      enteredValue = minValue;
    } else if (enteredValue > maxValue) {
      enteredValue = maxValue;
    }
    return TextEditingValue(
      text: enteredValue.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: enteredValue.toString().length),
      ),
    );
  }
}
