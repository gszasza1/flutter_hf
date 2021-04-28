import 'package:flutter/material.dart';
import 'package:movier/models/detailed_movie.dart';

@immutable
class GetMovieState {
  final bool loading;
  final DetailedMovie detailedMovie;
  final String error;

  // ignore: avoid_positional_boolean_parameters
  GetMovieState(this.loading, this.detailedMovie, this.error);

  factory GetMovieState.initial() =>
      GetMovieState(false, DetailedMovie.createInitDetailedMovie(), '');

  GetMovieState copyWith(
          {bool? loading, DetailedMovie? detailedMovie, String? error}) =>
      GetMovieState(
        loading ?? this.loading,
        detailedMovie ?? this.detailedMovie,
        error ?? this.error,
      );

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is GetMovieState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() => "GetMovieState { loading: $loading,  error: $error}";
}
