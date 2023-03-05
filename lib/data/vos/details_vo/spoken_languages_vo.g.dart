// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_languages_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguages _$SpokenLanguagesFromJson(Map<String, dynamic> json) =>
    SpokenLanguages(
      englishName: json['english_name'] as String?,
      iso6391: json['iso6391'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguagesToJson(SpokenLanguages instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
