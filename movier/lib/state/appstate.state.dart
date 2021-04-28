import 'package:flutter/material.dart';

import 'favourite_movie.state.dart';
import 'get_movie.state.dart';
import 'latest_movie.state.dart';

@immutable
class AppState {
	final FavouriteMovieState favouriteMovieState;
	final GetMovieState getMovieState;
	final LatestMovieState latestMovieState;

 // ignore: avoid_positional_boolean_parameters
	const AppState({
     required this.favouriteMovieState,
     required this.getMovieState,
     required this.latestMovieState,
  });

	factory AppState.initial() => AppState(
    favouriteMovieState: FavouriteMovieState.initial(),
    getMovieState: GetMovieState.initial(),
    latestMovieState: LatestMovieState.initial()
  );

	AppState copyWith({
     LatestMovieState? latestMovieState,
     GetMovieState? getMovieState,
     FavouriteMovieState? favouriteMovieState
    }) =>
		AppState(
      latestMovieState: latestMovieState ?? this.latestMovieState,
      favouriteMovieState: favouriteMovieState ?? this.favouriteMovieState,
      getMovieState: getMovieState ?? this.getMovieState
      );

	@override
 // ignore: type_annotate_public_apis
	bool operator == (other) =>
		identical(this, other) ||
		other is AppState &&
			runtimeType == other.runtimeType &&
			getMovieState == other.getMovieState &&
			favouriteMovieState == other.favouriteMovieState &&
			latestMovieState == other.latestMovieState;

	@override
	int get hashCode =>
		super.hashCode ^ 
    runtimeType.hashCode ^ 
    getMovieState.hashCode ^ 
    latestMovieState.hashCode ^ 
    favouriteMovieState.hashCode;

	@override
	String toString() => "AppState";
}
	  