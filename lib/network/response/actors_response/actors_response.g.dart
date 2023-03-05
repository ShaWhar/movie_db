// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsResponse _$ActorsResponseFromJson(Map<String, dynamic> json) =>
    ActorsResponse(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => ActorsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$ActorsResponseToJson(ActorsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResult,
    };
