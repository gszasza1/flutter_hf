import 'package:flutter/material.dart';
import 'package:movier/actions/favourite_movie.action.dart';

import 'package:movier/models/movie_result.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';

@immutable
class FavouriteMovieSelector {
  final List<MovieResult> favouriteList;
  final Function deleteFavouriteMovie;
  final Function(String) searchFavouriteMovie;
  final String? error;

  const FavouriteMovieSelector({
    required this.favouriteList,
    required this.deleteFavouriteMovie,
    required this.searchFavouriteMovie,
    required this.error,
  });

  factory FavouriteMovieSelector.fromStore(Store<AppState> store) {
    return FavouriteMovieSelector(
        error: store.state.favouriteMovieState.error,
        favouriteList: store.state.favouriteMovieState.searchText.isNotEmpty
            ? store.state.favouriteMovieState.movieList
                .where((element) =>
                    element.title != null &&
                    element.title!.toLowerCase().contains(store
                        .state.favouriteMovieState.searchText
                        .toLowerCase()))
                .toList()
            : store.state.favouriteMovieState.movieList,
        deleteFavouriteMovie: (int id) {
          store.dispatch(DeleteFavouriteMovieAction(
            id: id,
          ));
        },
        searchFavouriteMovie: (String searchText) {
          store.dispatch(SearchFavouriteMovie(
            searchText: searchText,
          ));
        });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteMovieSelector && runtimeType == other.runtimeType;

  @override
  int get hashCode => favouriteList.hashCode;
}

List<MovieResult> getFavouriteMovies(AppState state) =>
    state.favouriteMovieState.movieList;
