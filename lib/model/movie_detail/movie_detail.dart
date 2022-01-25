import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/movie_detail/genres.dart';
import 'package:movie_finder/model/movie_detail/production_companies.dart';
import 'production_countries.dart';
import 'spoken_languages.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  bool adult;
  String? backdrop_path;
  Object? belongs_to_collection;
  int budget;
  List<Genres> genres;
  String? homepage;
  int id;
  String? imdb_id;
  String original_language;
  String original_title;
  String? overview;
  num popularity;
  String? poster_path;
  List<ProductionCompanies> production_companies;
  List<ProductionCountries> production_countries;
  String release_date;
  int revenue;
  int? runtime;
  List<SpokenLanguages> spoken_languages;
  String status;
  String? tagline;
  String title;
  bool video;
  num vote_average;
  int vote_count;

  MovieDetail(
      this.adult,
      this.backdrop_path,
      this.belongs_to_collection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdb_id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.production_companies,
      this.production_countries,
      this.release_date,
      this.revenue,
      this.runtime,
      this.spoken_languages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count
      );

  factory MovieDetail.fromJson(Map<String, dynamic> parsedJson) => _$MovieDetailFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}