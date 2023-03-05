
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db_zoom/data/vos/actors_vo/actors_vo.dart';

part 'actors_response.g.dart';
@JsonSerializable()
class ActorsResponse{
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<ActorsVO>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResult;

  ActorsResponse(this.page, this.results, this.totalPages, this.totalResult);
  factory ActorsResponse.fromJson(Map<String,dynamic> json) => _$ActorsResponseFromJson(json);

}