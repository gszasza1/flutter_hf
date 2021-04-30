import 'package:flutter/material.dart';
import 'package:movier/models/movie_result.dart';

@immutable
class FavouriteMovieState {
  final List<MovieResult> movieList;
  final String searchText;
  final String? error;

  const FavouriteMovieState(this.movieList, this.searchText, this.error);

  factory FavouriteMovieState.initial() =>
      const FavouriteMovieState([], "", null);

  FavouriteMovieState copyWith(
          {List<MovieResult>? movieList, String? searchText, String? error}) =>
      FavouriteMovieState(movieList ?? this.movieList,
          searchText ?? this.searchText, error ?? this.error);

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      other is FavouriteMovieState &&
          runtimeType == other.runtimeType &&
          movieList == other.movieList;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ movieList.hashCode;

  @override
  String toString() => "FavouriteMovieState { movieList: $movieList}";
}
