import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production_companies.dart';  
import "production_countries.dart";
import "spoken_languages.dart";
  
part 'detailed_movie.g.dart';  
  
@JsonSerializable()  
class DetailedMovie{  
  bool adult;
  String backdropPath;
  String? belongsToCollection;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  int popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  int voteAverage;
  int voteCount;

  DetailedMovie(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);
    
  dynamic toJson() => _$DetailedMovieToJson(this);  
  factory DetailedMovie.fromJson(Map<String, dynamic> obj) => _$DetailedMovieFromJson(obj);
}
