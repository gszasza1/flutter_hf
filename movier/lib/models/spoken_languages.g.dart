// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_languages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguages _$SpokenLanguagesFromJson(Map<String, dynamic> json) {
  return SpokenLanguages(
    json['iso_639_1'] as String?,
    json['name'] as String,
    json['english_name'] as String?,
  );
}

Map<String, dynamic> _$SpokenLanguagesToJson(SpokenLanguages instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'name': instance.name,
      'english_name': instance.english_name,
    };
