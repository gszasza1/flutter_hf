
import 'package:flutter/material.dart';

class GetMovieAction {
  final String id;

  const GetMovieAction(this.id);

	@override
	String toString() {
	return 'GetMovieAction { }';
	}
}

class GetMovieSuccessAction {
	final int isSuccess;

	GetMovieSuccessAction({@required this.isSuccess});
	@override
	String toString() {
	return 'GetMovieSuccessAction { isSuccess: $isSuccess }';
	}
}

class GetMovieFailedAction {
	final String error;

	GetMovieFailedAction({@required this.error});

	@override
	String toString() {
	return 'GetMovieFailedAction { error: $error }';
	}
}
	