import 'package:json_annotation/json_annotation.dart';

part 'cast_tv_item.g.dart';

@JsonSerializable()
class CastTvItem {
  String? credit_id;
  String? original_name;
  int? id;
  List<int> genre_ids;
  String? character;
  String? name;
  String? poster_path;
  int? vote_count;
  num? vote_average;
  num? popularity;
  int? episode_count;
  String? original_language;
  String? first_air_date;
  String? backdrop_path;
  String? overview;
  List<String>? origin_country;

  CastTvItem(
      this.credit_id,
      this.original_name,
      this.id,
      this.genre_ids,
      this.character,
      this.name,
      this.poster_path,
      this.vote_count,
      this.vote_average,
      this.popularity,
      this.episode_count,
      this.original_language,
      this.first_air_date,
      this.backdrop_path,
      this.overview,
      this.origin_country
      );

  factory CastTvItem.fromJson(Map<String, dynamic> parsedJson) => _$CastTvItemFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastTvItemToJson(this);

}