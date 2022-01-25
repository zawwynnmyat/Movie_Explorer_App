import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/movie_detail/cast.dart';
import 'package:movie_finder/model/movie_detail/crew.dart';

part 'movie_credit.g.dart';

@JsonSerializable()
class MovieCredit {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  MovieCredit(this.id, this.cast, this.crew);

  factory MovieCredit.fromJson(Map<String, dynamic> parsedJson) => _$MovieCreditFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$MovieCreditToJson(this);
}