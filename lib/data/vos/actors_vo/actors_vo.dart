import 'package:json_annotation/json_annotation.dart';
import 'known_for_vo.dart';

part 'actors_vo.g.dart';
@JsonSerializable()
class ActorsVO {


  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'known_for')
  List<KnownFor>? knownFor;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  bool? isActorsView;

  ActorsVO(
      this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath,
      {
        this.isActorsView = false,
      });


  factory ActorsVO.fromJson(Map<String, dynamic> json) =>
      _$ActorsVOFromJson(json);
}





