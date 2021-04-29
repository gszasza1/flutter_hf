// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return MovieList(
    json['page'] as int,
    (json['results'] as List<dynamic>)
        .map((e) => MovieResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['total_results'] as int,
    json['total_pages'] as int,
  );
}

Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.total_results,
      'total_pages': instance.total_pages,
    };
