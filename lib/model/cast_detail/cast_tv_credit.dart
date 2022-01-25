import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/cast_detail/cast_tv_crew.dart';
import 'package:movie_finder/model/cast_detail/cast_tv_item.dart';

part 'cast_tv_credit.g.dart';

@JsonSerializable()
class CastTvCredit {
  int id;
  List<CastTvItem> cast;
  List<CastTvCrew> crew;

  CastTvCredit(
      this.id,
      this.cast,
      this.crew
      );

  factory CastTvCredit.fromJson(Map<String, dynamic> parsedJson) => _$CastTvCreditFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastTvCreditToJson(this);

}