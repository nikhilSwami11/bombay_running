import 'package:bombay_running/features/home/data/model/criteria_model.dart';
import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final int? id;
  final String? name;
  final String? tag;
  final String? color;
  final List<Criteria>? criteria;

  const Stock({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  Stock copyWith({
    int? id,
    String? name,
    String? tag,
    String? color,
    List<Criteria>? criteria,
  }) {
    return Stock(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
      color: color ?? this.color,
      criteria: criteria ?? this.criteria,
    );
  }

  factory Stock.fromJson(Map<String, dynamic> json) {
    int? id = json['id'];
    String? name = json['name'];
    String? tag = json['tag'];
    String? color = json['color'];
    List<Criteria>? criteria;
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria!.add(Criteria.fromJson(v));
      });
    }
    return Stock(
      id: id,
      name: name,
      tag: tag,
      color: color,
      criteria: criteria,
    );
  }

  @override
  List<Object?> get props => [id, name, tag, color, criteria];
}
