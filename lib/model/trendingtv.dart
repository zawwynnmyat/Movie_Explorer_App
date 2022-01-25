import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/trendingtvitem.dart';

part 'trendingtv.g.dart';

@JsonSerializable()
class TrendingTV {

  int page;
  List<TrendingTVItem> results;
  int total_pages;
  int total_results;

  TrendingTV(
      this.page,
      this.results,
      this.total_pages,
      this.total_results
      );
  factory TrendingTV.fromJson(Map<String, dynamic> parsedJson) => _$TrendingTVFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$TrendingTVToJson(this);


}