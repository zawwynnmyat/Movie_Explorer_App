import 'package:json_annotation/json_annotation.dart';

part 'moviesingle.g.dart';

@JsonSerializable()
class MovieSingle {
   bool? adult;
   String? backdrop_path;
   List<int> genre_ids;
   int? id;
   String? original_language;
   String? original_title;
   String? overview;
   double? popularity;
   String? poster_path;
   String? release_date;
   String? title;
   bool? video;
   double? vote_average;
   int? vote_count;

   MovieSingle(
       this.adult,
       this.backdrop_path,
       this.genre_ids,
       this.id,
       this.original_language,
       this.original_title,
       this.overview,
       this.popularity,
       this.poster_path,
       this.release_date,
       this.title,
       this.video,
       this.vote_average,
       this.vote_count
       );

   factory MovieSingle.fromJson(Map<String, dynamic> parsedJson) => _$MovieSingleFromJson(parsedJson);
   Map<String, dynamic> toJson() => _$MovieSingleToJson(this);
}