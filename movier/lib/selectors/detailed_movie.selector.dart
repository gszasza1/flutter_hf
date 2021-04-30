import 'package:flutter/material.dart';
import 'package:movier/actions/favourite_movie.action.dart';
import 'package:movier/actions/get_movie.action.dart';
import 'package:movier/models/detailed_movie.dart';
import 'package:movier/models/movie_result.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';

@immutable
class DetailedMovieSelector {
  final DetailedMovie detailedMovie;
  final Function getMovieById;
  final Function(DetailedMovie) addFavouriteMovie;
  final bool inList;

  const DetailedMovieSelector({
    required this.detailedMovie,
    required this.getMovieById,
    required this.addFavouriteMovie,
    required this.inList,
  });

  factory DetailedMovieSelector.fromStore(Store<AppState> store, int id) {
    return DetailedMovieSelector(
      detailedMovie: store.state.getMovieState.detailedMovie,
      inList: store.state.favouriteMovieState.movieList
          .where((element) => element.id == id)
          .toList()
          .isEmpty,
      getMovieById: (int id) {
        store.dispatch(GetMovieAction(
          id: id,
        ));
      },
      addFavouriteMovie: (DetailedMovie result) {
        store.dispatch(AddFavouriteMovieAction(
          movie: result,
        ));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailedMovieSelector && runtimeType == other.runtimeType;

  @override
  int get hashCode => detailedMovie.hashCode;
}
