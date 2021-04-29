// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'movie_result.g.dart';

@JsonSerializable()
class MovieResult {
  String poster_path;
  bool adult;
  String overview;
  String release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String backdrop_path;
  double popularity;
  int vote_count;
  bool video;
  double vote_average;

  MovieResult(
      this.poster_path,
      // ignore: avoid_positional_boolean_parameters
      this.adult,
      this.overview,
      this.release_date,
      this.genre_ids,
      this.id,
      this.original_title,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.video,
      this.vote_average);

  dynamic toJson() => _$MovieResultToJson(this);
  factory MovieResult.fromJson(Map<String, dynamic> obj) =>
      _$MovieResultFromJson(obj);
}
