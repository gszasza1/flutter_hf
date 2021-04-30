import 'package:flutter/material.dart';
import 'package:movier/models/movie_list.dart';

class SearchMovieAction {
  final String searchText;
  const SearchMovieAction(this.searchText);
  @override
  String toString() {
    return 'SearchMovieAction { }';
  }
}

class SearchMovieSuccessAction {
  final MovieList movieList;

  SearchMovieSuccessAction({required this.movieList});
  @override
  String toString() {
    return 'SearchMovieSuccessAction { movieList: $movieList }';
  }
}

class SearchMovieFailedAction {
  final String error;

  SearchMovieFailedAction({required this.error});

  @override
  String toString() {
    return 'SearchMovieFailedAction { error: $error }';
  }
}
