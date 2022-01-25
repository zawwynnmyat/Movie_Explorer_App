import 'package:json_annotation/json_annotation.dart';

part 'cast_movie_item.g.dart';

@JsonSerializable()
class CastMovieItem {
   String? character;
   String? credit_id;
   String? release_date;
   int vote_count;
   bool video;
   bool adult;
   num vote_average;
   String? title;
   List<int> genre_ids;
   String? original_language;
   String? original_title;
   num popularity;
   int id;
   String? backdrop_path;
   String? overview;
   String? poster_path;
   num? order;

   CastMovieItem(
       this.character,
       this.credit_id,
       this.release_date,
       this.vote_count,
       this.video,
       this.adult,
       this.vote_average,
       this.title,
       this.genre_ids,
       this.original_language,
       this.original_title,
       this.popularity,
       this.id,
       this.backdrop_path,
       this.overview,
       this.poster_path,
       this.order
       );

   factory CastMovieItem.fromJson(Map<String, dynamic> parsedJson) => _$CastMovieItemFromJson(parsedJson);
   Map<String, dynamic> toJson() => _$CastMovieItemToJson(this);
}