// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import 'movie_result.dart';

part 'movie_list.g.dart';

@JsonSerializable()
class MovieList {
  int page;
  List<MovieResult> results;
  int total_results;
  int total_pages;

  MovieList(this.page, this.results, this.total_results, this.total_pages);

  dynamic toJson() => _$MovieListToJson(this);
  factory MovieList.fromJson(Map<String, dynamic> obj) => _$MovieListFromJson(obj);
  factory MovieList.createInitMovieList() {
    return MovieList(
        0,[],0,0
        );
  }
}