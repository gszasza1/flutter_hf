import 'package:flutter/material.dart';
import 'package:movier/models/movie_list.dart';

@immutable
class LatestMovieState {
  final bool loading;
  final String error;
  final MovieList movieList;
  final String searchText;

  const LatestMovieState(
      // ignore: avoid_positional_boolean_parameters
      this.loading,
      this.error,
      this.movieList,
      this.searchText);

  factory LatestMovieState.initial() =>
      LatestMovieState(false, '', MovieList.createInitMovieList(), "");

  LatestMovieState copyWith(
          {bool? loading,
          String? error,
          MovieList? movieList,
          String? searchText}) =>
      LatestMovieState(loading ?? this.loading, error ?? this.error,
          movieList ?? this.movieList, searchText ?? this.searchText);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestMovieState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^
      runtimeType.hashCode ^
      loading.hashCode ^
      error.hashCode ^
      movieList.hashCode;

  @override
  String toString() => "MainListState { loading: $loading,  error: $error}";
}
