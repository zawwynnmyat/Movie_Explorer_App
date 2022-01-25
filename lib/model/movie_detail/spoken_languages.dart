import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages.g.dart';

@JsonSerializable()
class SpokenLanguages {
  String iso_639_1;
  String name;

  SpokenLanguages(this.iso_639_1, this.name);

  factory SpokenLanguages.fromJson(Map<String, dynamic> parsedJson) => _$SpokenLanguagesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);

}