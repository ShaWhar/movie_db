import 'package:json_annotation/json_annotation.dart';

part 'genres_response.g.dart';
@JsonSerializable()
class GenresResponse{
  @JsonKey(name: "genres")
  String? genres;


  GenresResponse(this.genres);
  factory GenresResponse.fromJson(Map<String,dynamic> json) => _$GenresResponseFromJson(json);

}