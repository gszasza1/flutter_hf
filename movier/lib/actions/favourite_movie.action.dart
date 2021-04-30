import 'package:movier/models/detailed_movie.dart';

class AddFavouriteMovieAction {
  final DetailedMovie movie;

  AddFavouriteMovieAction({required this.movie});
  @override
  String toString() {
    return 'AddFavouriteMovieAction { movie: $movie}';
  }
}

class DeleteFavouriteMovieAction {
  final int id;

  DeleteFavouriteMovieAction({required this.id});
  @override
  String toString() {
    return 'DeleteFavouriteMovieAction { id: $id }';
  }
}

class SearchFavouriteMovie {
  final String searchText;

  SearchFavouriteMovie({required this.searchText});

  @override
  String toString() {
    return 'SearchFavouriteMovie { searchText: $searchText }';
  }
}
