import 'package:json_annotation/json_annotation.dart';

part 'profiles.g.dart';

@JsonSerializable()
class Profiles {
  num aspect_ratio;
  String file_path;
  int height;
  String? iso_639_1;
  num vote_average;
  int vote_count;
  int width;

  Profiles(
      this.aspect_ratio,
      this.file_path,
      this.height,
      this.iso_639_1,
      this.vote_average,
      this.vote_count,
      this.width
      );

  factory Profiles.fromJson(Map<String, dynamic> parsedJson) => _$ProfilesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$ProfilesToJson(this);
}