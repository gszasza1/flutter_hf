import 'package:flutter/material.dart';
import 'package:movier/actions/get_movie.action.dart';
import 'package:movier/models/detailed_movie.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';

@immutable
class DetailedMovieSelector {
  final DetailedMovie detailedMovie;
  final Function getMovieById;

  DetailedMovieSelector({
    required this.detailedMovie,
    required this.getMovieById,
  });

  factory DetailedMovieSelector.fromStore(Store<AppState> store) {
    return DetailedMovieSelector(
      detailedMovie: store.state.getMovieState.detailedMovie,  
      getMovieById: (String id) {
        store.dispatch(GetMovieAction(id:id,));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailedMovieSelector &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => detailedMovie.hashCode;
}
