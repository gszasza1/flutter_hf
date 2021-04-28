import 'package:flutter/material.dart';

@immutable
class GetMovieState {
	final bool loading;
	final String error;

	GetMovieState(this.loading, this.error);

	factory GetMovieState.initial() => GetMovieState(false, '');

	GetMovieState copyWith({bool loading, String error}) =>
		GetMovieState(loading ?? this.loading, error ?? this.error);

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
	  