import 'package:flutter/material.dart';

class LatestMovieAction {
  @override
  String toString() {
    return 'LatestMovieAction { }';
  }
}

class LatestMovieSuccessAction {
  final int isSuccess;

  LatestMovieSuccessAction({required this.isSuccess});
  @override
  String toString() {
    return 'LatestMovieSuccessAction { isSuccess: $isSuccess }';
  }
}

class LatestMovieFailedAction {
  final String error;

  LatestMovieFailedAction({required this.error});

  @override
  String toString() {
    return 'LatestMovieFailedAction { error: $error }';
  }
}
