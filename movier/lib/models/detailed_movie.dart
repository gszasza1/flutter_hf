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

  DetailedMovie({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount});

  factory DetailedMovie.createInitDetailedMovie(){
    return DetailedMovie(
      adult: false, 
      backdropPath :"", 
      belongsToCollection:null, 
      budget:0, 
      genres:[], 
      homepage:"", 
      id:0, 
      imdbId:"", 
      originalLanguage:"", 
      originalTitle:"", 
      overview:"", 
      popularity:0, 
      posterPath:"", 
      productionCompanies:[], 
      productionCountries:[], 
      releaseDate:"", 
      revenue:0, 
      runtime:0, 
      spokenLanguages:[], 
      status:"", 
      tagline:"", 
      title:"", 
      video:false, 
      voteAverage:0, 
      voteCount:0
      ); 
    }
  dynamic toJson() => _$DetailedMovieToJson(this);  
  factory DetailedMovie.fromJson(Map<String, dynamic> obj) => _$DetailedMovieFromJson(obj);
}
