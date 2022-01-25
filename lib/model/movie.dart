import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/moviesingle.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int page;
  int total_pages;
  List<MovieSingle> results;
  int total_results;

  Movie(
      this.page,
      this.total_pages,
      this.results,
      this.total_results
      );

 // var list = parsedJson['results'] as List;
  //print(list.runtimeType);
  //List<MovieSingle> moviesList = list.map((i) => MovieSingle.fromJson(i)).toList();
  //print(moviesList.runtimeType);

  factory Movie.fromJson(Map<String, dynamic> parsedJson) => _$MovieFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}