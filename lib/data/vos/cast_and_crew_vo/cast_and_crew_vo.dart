
import 'package:json_annotation/json_annotation.dart';

part 'cast_and_crew_vo.g.dart';

@JsonSerializable()
class CastAndCrewVO {
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'cast_id')
  int? castId;
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'job')
  int? job;
  bool? isCastView;

  bool? isCrewView;




  CastAndCrewVO(
      this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
      {this.isCastView = false,
        this.isCrewView = false,
      });


  factory CastAndCrewVO.fromJson(Map<String, dynamic> json) =>
      _$CastAndCrewVOFromJson(json);


}