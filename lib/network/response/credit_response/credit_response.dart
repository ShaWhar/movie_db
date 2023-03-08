import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/cast_and_crew_vo/cast_vo.dart';
import '../../../data/vos/cast_and_crew_vo/crew_vo.dart';

part 'credit_response.g.dart';
@JsonSerializable()
class CreditResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "cast")
  List<CastVO>? cast;
  @JsonKey(name: "crew")
  List<CrewVO>? crew;


  CreditResponse(this.id,);
  factory CreditResponse.fromJson(Map<String,dynamic> json) => _$CreditResponseFromJson(json);

}