import 'package:flutter/material.dart';
import 'package:movier/actions/latest_movie.action.dart';
import 'package:movier/models/movie_list.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';

@immutable
class LatestMovieSelector {
  final MovieList movieList;
  final Function getLatestMovieList;

  const LatestMovieSelector({
    required this.movieList,
    required this.getLatestMovieList,
  });

  factory LatestMovieSelector.fromStore(Store<AppState> store) {
    return LatestMovieSelector(
      movieList: store.state.latestMovieState.movieList,
      getLatestMovieList: () {
        print("sajt");
        store.dispatch(LatestMovieAction());
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestMovieSelector && runtimeType == other.runtimeType;

  @override
  int get hashCode => movieList.hashCode;
}
