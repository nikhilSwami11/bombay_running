import 'package:bombay_running/features/home/data/model/variable_model.dart';
import 'package:equatable/equatable.dart';

class Criteria extends Equatable {
  final String? type;
  final String? text;
  final List<String>? variableValue;
  final Map<String, Variable>? variableProperties;

  const Criteria({
    this.type,
    this.text,
    this.variableValue,
    this.variableProperties,
  });

  Criteria copyWith({
    String? type,
    String? text,
    List<String>? variableValue,
    Map<String, Variable>? variableProperties,
  }) {
    return Criteria(
        type: type ?? this.type,
        text: text ?? this.text,
        variableValue: variableValue ?? this.variableValue,
        variableProperties: variableProperties ?? this.variableProperties);
  }

  factory Criteria.fromJson(Map<String, dynamic> json) {
    String? type = json['type'];
    String? text = json['text'];
    List<String>? variableValue = json['variable'] != null
        ? (json['variable'] as Map<String, dynamic>).keys.toList()
        : null;
    Map<String, Variable>? variableProperties;
    if (variableValue != null) {
      variableProperties ??= {};
      for (var element in variableValue) {
        variableProperties[element] =
            Variable.fromJson(json['variable'][element]);
      }
    }
    return Criteria(
        type: type,
        text: text,
        variableValue: variableValue,
        variableProperties: variableProperties);
  }

  @override
  List<Object?> get props => [type, text, variableValue, variableProperties];
}
