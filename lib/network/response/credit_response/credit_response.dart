import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';

part 'credit_response.g.dart';
@JsonSerializable()
class CreditResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "cast")
  List<CastAndCrewVO>? cast;
  @JsonKey(name: "crew")
  List<CastAndCrewVO>? crew;


  CreditResponse(this.id,);
  factory CreditResponse.fromJson(Map<String,dynamic> json) => _$CreditResponseFromJson(json);

}