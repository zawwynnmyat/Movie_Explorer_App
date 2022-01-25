import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/cast_detail/profiles.dart';

part 'cast_images.g.dart';

@JsonSerializable()
class CastImages {
  int id;
  List<Profiles> profiles;

  CastImages(this.id, this.profiles);

  factory CastImages.fromJson(Map<String, dynamic> parsedJson) => _$CastImagesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastImagesToJson(this);
}