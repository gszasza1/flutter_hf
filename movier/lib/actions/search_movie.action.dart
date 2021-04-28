
import 'package:flutter/material.dart';

class SearchMovieAction {

	@override
	String toString() {
	return 'SearchMovieAction { }';
	}
}

class SearchMovieSuccessAction {
	final int isSuccess;

	SearchMovieSuccessAction({@required this.isSuccess});
	@override
	String toString() {
	return 'SearchMovieSuccessAction { isSuccess: $isSuccess }';
	}
}

class SearchMovieFailedAction {
	final String error;

	SearchMovieFailedAction({@required this.error});

	@override
	String toString() {
	return 'SearchMovieFailedAction { error: $error }';
	}
}
	