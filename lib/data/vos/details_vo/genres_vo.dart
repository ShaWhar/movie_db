
import 'package:json_annotation/json_annotation.dart';

part 'genres_vo.g.dart';

@JsonSerializable()
class Genres {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

}