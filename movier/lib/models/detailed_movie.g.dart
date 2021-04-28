// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedMovie _$DetailedMovieFromJson(Map<String, dynamic> json) {
  return DetailedMovie(
    json['adult'] as bool,
    json['backdropPath'] as String,
    json['belongsToCollection'] as String?,
    json['budget'] as int,
    (json['genres'] as List<dynamic>)
        .map((e) => Genres.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['homepage'] as String,
    json['id'] as int,
    json['imdbId'] as String,
    json['originalLanguage'] as String,
    json['originalTitle'] as String,
    json['overview'] as String,
    json['popularity'] as int,
    json['posterPath'] as String,
    (json['productionCompanies'] as List<dynamic>)
        .map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['productionCountries'] as List<dynamic>)
        .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['releaseDate'] as String,
    json['revenue'] as int,
    json['runtime'] as int,
    (json['spokenLanguages'] as List<dynamic>)
        .map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['status'] as String,
    json['tagline'] as String,
    json['title'] as String,
    json['video'] as bool,
    json['voteAverage'] as int,
    json['voteCount'] as int,
  );
}

Map<String, dynamic> _$DetailedMovieToJson(DetailedMovie instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'belongsToCollection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
