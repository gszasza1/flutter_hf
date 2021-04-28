import 'package:flutter/material.dart';

@immutable
class LatestMovieState {
	final bool loading;
	final String error;

	LatestMovieState(this.loading, this.error);

	factory LatestMovieState.initial() => LatestMovieState(false, '');

	LatestMovieState copyWith({bool? loading, String? error}) =>
		LatestMovieState(loading ?? this.loading, error ?? this.error);

	@override
	bool operator ==(other) =>
		identical(this, other) ||
		other is LatestMovieState &&
			runtimeType == other.runtimeType &&
			loading == other.loading &&
			error == other.error;

	@override
	int get hashCode =>
		super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

	@override
	String toString() => "MainListState { loading: $loading,  error: $error}";
}
	  