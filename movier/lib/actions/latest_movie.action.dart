import 'package:movier/models/movie_list.dart';

class LatestMovieAction {
  @override
  String toString() {
    return 'LatestMovieAction { }';
  }
}

class LatestMovieSuccessAction {
  final MovieList movieList;
  LatestMovieSuccessAction({required this.movieList});
  @override
  String toString() {
    return 'LatestMovieSuccessAction { movieList: $movieList }';
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

class ChangeMovieText {
  final String searchText;

  ChangeMovieText({required this.searchText});

  @override
  String toString() {
    return 'ChangeMovieText { searchText: $searchText }';
  }
}
