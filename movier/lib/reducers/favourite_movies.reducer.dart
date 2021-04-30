import 'package:movier/actions/favourite_movie.action.dart';
import 'package:movier/extensions/converter.dart';
import 'package:movier/state/favourite_movie.state.dart';
import 'package:redux/redux.dart';

final favouritemoviesReducer = combineReducers<FavouriteMovieState>([
  TypedReducer<FavouriteMovieState, AddFavouriteMovieAction>(
      _addFavouriteMovieDone),
  TypedReducer<FavouriteMovieState, DeleteFavouriteMovieAction>(
      _deleteFavouriteMovie),
  TypedReducer<FavouriteMovieState, SearchFavouriteMovie>(
      _searchFavouriteMovie),
]);

FavouriteMovieState _addFavouriteMovieDone(
        FavouriteMovieState state, AddFavouriteMovieAction action){
final inList = state.movieList.where((element) => element.id != action.movie.id).toList().isNotEmpty;
  return inList?state:  state.copyWith(movieList: [
      ...state.movieList,
      Converter.movieResultToDetailedMovie(action.movie)
    ]);
        }

FavouriteMovieState _deleteFavouriteMovie(
    FavouriteMovieState state, DeleteFavouriteMovieAction action) {
  final newState = state.copyWith(
      movieList:
          state.movieList.where((element) => element.id != action.id).toList());
  return newState;
}

FavouriteMovieState _searchFavouriteMovie(
        FavouriteMovieState state, SearchFavouriteMovie action) =>
    state.copyWith(searchText: action.searchText);
