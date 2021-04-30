// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
    backdrop_path: json['backdrop_path'] as String?,
    id: json['id'] as int,
    poster_path: json['poster_path'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'poster_path': instance.poster_path,
      'name': instance.name,
    };
