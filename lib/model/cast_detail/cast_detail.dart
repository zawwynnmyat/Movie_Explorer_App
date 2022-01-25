import 'package:json_annotation/json_annotation.dart';

part 'cast_detail.g.dart';

@JsonSerializable()
class CastDetail {
   String? birthday;
   String? known_for_department;
   String? deathday;
   int id;
   String name;
   List<String>? also_known_as;
   int gender;
   String? biography;
   num popularity;
   String? place_of_birth;
   String? profile_path;
   bool adult;
   String? imdb_id;
   String? homepage;

   CastDetail(
       this.birthday,
       this.known_for_department,
       this.deathday,
       this.id,
       this.name,
       this.also_known_as,
       this.gender,
       this.biography,
       this.popularity,
       this.place_of_birth,
       this.adult,
       this.imdb_id,
       this.homepage
       );

   factory CastDetail.fromJson(Map<String, dynamic> parsedJson) => _$CastDetailFromJson(parsedJson);
   Map<String, dynamic> toJson() => _$CastDetailToJson(this);
}