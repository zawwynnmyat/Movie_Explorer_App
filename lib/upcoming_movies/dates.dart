import 'package:json_annotation/json_annotation.dart';

part 'dates.g.dart';

@JsonSerializable()
class Dates {
  String? maximum;
  String? minimum;

  Dates(this.maximum, this.minimum);

  factory Dates.fromJson(Map<String, dynamic> parsedJson) => _$DatesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$DatesToJson(this);

}