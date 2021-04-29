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
    return 'LatestMovieSuccessAction { isSuccess: $movieList }';
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
