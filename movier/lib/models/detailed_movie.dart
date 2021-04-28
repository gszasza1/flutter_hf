import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production_companies.dart';
import "production_countries.dart";
import "spoken_languages.dart";

part 'detailed_movie.g.dart';

@JsonSerializable()
class DetailedMovie {
  bool adult;
  String? backdrop_path = "";
  String? belongs_to_collection = "";
  int budget;
  List<Genres> genres;
  String? homepage = "";
  int id;
  String? imdb_id = "";
  String? original_language = "";
  String? original_title = "";
  String? overview;
  double popularity;
  String? poster_path = "";
  List<ProductionCompanies> production_companies;
  List<ProductionCountries> production_countries;
  String release_date = "";
  int revenue;
  int runtime;
  List<SpokenLanguages> spoken_languages;
  String? status = "";
  String? tagline = "";
  String title = "";
  bool video;
  double vote_average;
  int vote_count;

  DetailedMovie(
      {required this.adult,
      required this.backdrop_path,
      required this.belongs_to_collection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdb_id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.production_companies,
      required this.production_countries,
      required this.release_date,
      required this.revenue,
      required this.runtime,
      required this.spoken_languages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory DetailedMovie.createInitDetailedMovie() {
    return DetailedMovie(
        adult: false,
        backdrop_path: "",
        belongs_to_collection: "",
        budget: 0,
        genres: [],
        homepage: "",
        id: 0,
        imdb_id: "",
        original_language: "",
        original_title: "",
        overview: "",
        popularity: 0,
        poster_path: "",
        production_companies: [],
        production_countries: [],
        release_date: "",
        revenue: 0,
        runtime: 0,
        spoken_languages: [],
        status: "",
        tagline: "",
        title: "",
        video: false,
        vote_average: 0,
        vote_count: 0);
  }
  dynamic toJson() => _$DetailedMovieToJson(this);
  factory DetailedMovie.fromJson(Map<String, dynamic> obj) =>
      _$DetailedMovieFromJson(obj);
}
