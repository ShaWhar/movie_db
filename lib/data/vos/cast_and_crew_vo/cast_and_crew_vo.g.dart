// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_and_crew_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastAndCrewVO _$CastAndCrewVOFromJson(Map<String, dynamic> json) =>
    CastAndCrewVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int?,
      json['character'] as String?,
      json['credit_id'] as String?,
      json['order'] as int?,
      json['department'] as String?,
      json['job'] as int?,
      isCastView: json['isCastView'] as bool? ?? false,
      isCrewView: json['isCrewView'] as bool? ?? false,
    );

Map<String, dynamic> _$CastAndCrewVOToJson(CastAndCrewVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
      'isCastView': instance.isCastView,
      'isCrewView': instance.isCrewView,
    };
