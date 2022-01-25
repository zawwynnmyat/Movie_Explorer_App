import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@JsonSerializable()
class Genres {
  int id;
  String name;

  Genres(this.id, this.name);

  factory Genres.fromJson(Map<String, dynamic> parsedJson) => _$GenresFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$GenresToJson(this);

}