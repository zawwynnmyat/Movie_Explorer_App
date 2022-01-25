import 'package:json_annotation/json_annotation.dart';

part 'similar_tv_item.g.dart';

@JsonSerializable()
class SimilarTvItem {
  String? poster_path;
  String overview;
  num? vote_average;
  String first_air_date;
  List<int> genre_ids;
  int id;
  String original_name;
  String original_language;
  List<String> origin_country;
  String name;
  String? backdrop_path;
  num? popularity;
  int vote_count;

  SimilarTvItem(
      this.poster_path,
      this.overview,
      this.vote_average,
      this.first_air_date,
      this.genre_ids,
      this.id,
      this.original_name,
      this.original_language,
      this.origin_country,
      this.name,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      );

  factory SimilarTvItem.fromJson(Map<String, dynamic> parsedJson) => _$SimilarTvItemFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$SimilarTvItemToJson(this);

}