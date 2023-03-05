// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsVO _$ActorsVOFromJson(Map<String, dynamic> json) => ActorsVO(
      json['adult'] as bool?,
      json['backdropPath'] as String?,
      (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['originalLanguage'] as String?,
      json['originalTitle'] as String?,
      json['overView'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['posterPath'] as String?,
      json['releaseDate'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['voteAverage'] as num?)?.toDouble(),
      json['voteCount'] as int?,
      isActorsView: json['isActorsView'] as bool? ?? false,
    );

Map<String, dynamic> _$ActorsVOToJson(ActorsVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overView': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'isActorsView': instance.isActorsView,
    };
