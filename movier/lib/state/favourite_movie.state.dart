import 'package:flutter/material.dart';

@immutable
class FavouriteMovieState {
	final bool loading;
	final String error;

 // ignore: avoid_positional_boolean_parameters
	const FavouriteMovieState(this.loading, this.error);

	factory FavouriteMovieState.initial() => const FavouriteMovieState(false, '');

	FavouriteMovieState copyWith({bool loading, String error}) =>
		FavouriteMovieState(loading ?? this.loading, error ?? this.error);

	@override
	bool operator ==(dynamic other) =>
		identical(this, other) ||
		other is FavouriteMovieState &&
			runtimeType == other.runtimeType &&
			loading == other.loading &&
			error == other.error;

	@override
	int get hashCode =>
		super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

	@override
	String toString() => "FavouriteMovieState { loading: $loading,  error: $error}";
}
	  