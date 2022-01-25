import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/trmovieitem.dart';

part 'trmovie.g.dart';

@JsonSerializable()
class TRMovie {
 int page;
 List<TRMovieItem> results;
 int total_results;
 int total_pages;

 TRMovie(
     this.page, this.results, this.total_results, this.total_pages
     );

 factory TRMovie.fromJson(Map<String, dynamic> json) => _$TRMovieFromJson(json);

 Map<String, dynamic> toJson() => _$TRMovieToJson(this);

}