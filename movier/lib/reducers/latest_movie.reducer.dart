import 'package:movier/actions/latest_movie.action.dart';
import 'package:movier/actions/search_movie.action.dart';
import 'package:movier/state/latest_movie.state.dart';
import 'package:redux/redux.dart';

final latestMovieReducer = combineReducers<LatestMovieState>([
  TypedReducer<LatestMovieState, LatestMovieAction>(_loadMovieRequest),
  TypedReducer<LatestMovieState, LatestMovieSuccessAction>(_loadMovieResponse),
  TypedReducer<LatestMovieState, LatestMovieFailedAction>(_loadMovieError),
  TypedReducer<LatestMovieState, SearchMovieAction>(_changeSearchText),
  TypedReducer<LatestMovieState, SearchMovieSuccessAction>(_searchSuccess),
]);

LatestMovieState _loadMovieRequest(
        LatestMovieState state, LatestMovieAction action) =>
    state.copyWith(loading: true, error: "");

LatestMovieState _loadMovieResponse(
    LatestMovieState state, LatestMovieSuccessAction action) {
  final newState =
      state.copyWith(loading: false, error: "", movieList: action.movieList);
  return newState;
}

LatestMovieState _loadMovieError(
        LatestMovieState state, LatestMovieFailedAction action) =>
    state.copyWith(loading: false, error: action.error);

LatestMovieState _changeSearchText(
        LatestMovieState state, SearchMovieAction action) =>
    state.copyWith(searchText: action.searchText);

LatestMovieState _searchSuccess(
        LatestMovieState state, SearchMovieSuccessAction action) =>
    state.copyWith(movieList: action.movieList);
