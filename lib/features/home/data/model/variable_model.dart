import 'package:equatable/equatable.dart';

class Variable extends Equatable {
  final String? type;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;
  final List<double>? values;
  final int? selectedValueIndex;

  const Variable({
    this.type,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.values,
    this.selectedValueIndex,
  });

  Variable copyWith({
    String? type,
    String? studyType,
    String? parameterName,
    int? minValue,
    int? maxValue,
    int? defaultValue,
    List<double>? values,
    int? selectedValueIndex,
  }) {
    return Variable(
        type: type ?? this.type,
        studyType: studyType ?? this.studyType,
        parameterName: parameterName ?? this.parameterName,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        defaultValue: defaultValue ?? this.defaultValue,
        values: values ?? this.values,
        selectedValueIndex: selectedValueIndex ?? this.selectedValueIndex);
  }

  factory Variable.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final studyType = json['study_type'];
    final parameterName = json['parameter_name'];
    final minValue = json['min_value'];
    final maxValue = json['max_value'];
    final defaultValue = json['default_value'];
    final selectedValueIndex = json['selected_value_index'];

    List<double>? values;
    if (json['values'] != null) {
      values = (json['values'] as List<dynamic>)
          .map((element) => double.parse(element.toString()))
          .toList();
    }

    return Variable(
        type: type,
        studyType: studyType,
        parameterName: parameterName,
        minValue: minValue,
        maxValue: maxValue,
        defaultValue: defaultValue,
        values: values,
        selectedValueIndex: selectedValueIndex);
  }

  @override
  List<Object?> get props => [
        type,
        studyType,
        parameterName,
        minValue,
        maxValue,
        defaultValue,
        values,
        selectedValueIndex,
      ];
}
