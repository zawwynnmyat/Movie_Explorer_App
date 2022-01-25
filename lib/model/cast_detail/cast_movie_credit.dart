import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/cast_detail/cast_movie_item.dart';
import 'package:movie_finder/model/cast_detail/cast_crew_item.dart';

part 'cast_movie_credit.g.dart';

@JsonSerializable()
class CastMovieCredit {
  int id;
  List<CastMovieItem> cast;
  List<CastCrewItem> crew;

  CastMovieCredit(
      this.id,
      this.cast,
      this.crew
      );

  factory CastMovieCredit.fromJson(Map<String, dynamic> parsedJson) => _$CastMovieCreditFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastMovieCreditToJson(this);
}