class NumberFormatter {
  static String formatStringDouble(String stringValue) {
    double? parsedValue = double.tryParse(stringValue);
    if (parsedValue != null) {
      if (parsedValue == parsedValue.truncateToDouble()) {
        // If the parsed value is an integer (no fractional part),
        // format it as an integer.
        return parsedValue.toInt().toString();
      } else {
        // If the parsed value has a fractional part, format it with
        // the decimal places.
        return parsedValue.toString();
      }
    } else {
      // If parsing fails, return the original string.
      return stringValue;
    }
  }
}
