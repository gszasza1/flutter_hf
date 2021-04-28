import 'package:flutter/material.dart';

class FavouriteMovieAction {
  @override
  String toString() {
    return 'FavouriteMovieAction { }';
  }
}

class FavouriteMovieSuccessAction {
  final int isSuccess;

  FavouriteMovieSuccessAction({required this.isSuccess});
  @override
  String toString() {
    return 'FavouriteMovieSuccessAction { isSuccess: $isSuccess }';
  }
}

class FavouriteMovieFailedAction {
  final String error;

  FavouriteMovieFailedAction({required this.error});

  @override
  String toString() {
    return 'FavouriteMovieFailedAction { error: $error }';
  }
}
