import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/trendingmovieitem.dart';
import 'package:movie_finder/model/trtvitme.dart';

part 'trtv.g.dart';

@JsonSerializable()
class TopRatedTV {

  int page;
  List<TopRatedTVItem> results;
  int total_pages;
  int total_results;

  TopRatedTV(
      this.page,
      this.results,
      this.total_pages,
      this.total_results
      );
  factory TopRatedTV.fromJson(Map<String, dynamic> parsedJson) => _$TopRatedTVFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$TopRatedTVToJson(this);

}