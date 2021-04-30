import 'package:flutter/material.dart';
import 'package:movier/actions/latest_movie.action.dart';
import 'package:movier/models/movie_list.dart';
import 'package:movier/models/movie_result.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';

@immutable
class LatestMovieSelector {
  final List<MovieResult> movieList;
  final bool loading;
  final Function getLatestMovieList;
  final Function(String) onMovieSearchChange;

  const LatestMovieSelector({
    required this.movieList,
    required this.loading,
    required this.getLatestMovieList,
    required this.onMovieSearchChange,
  });

  factory LatestMovieSelector.fromStore(Store<AppState> store) {
    return LatestMovieSelector(
        loading: store.state.latestMovieState.loading,
        movieList: store.state.latestMovieState.movieList.results
            .where((element) =>
                element.title.contains(store.state.latestMovieState.searchText))
            .toList(),
        getLatestMovieList: () {
          store.dispatch(LatestMovieAction());
        },
        onMovieSearchChange: (String e) {
          store.dispatch(ChangeMovieText(searchText: e));
        });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestMovieSelector && runtimeType == other.runtimeType;

  @override
  int get hashCode => movieList.hashCode;
}
