import 'package:movier/actions/latest_movie.action.dart';
import 'package:movier/state/latest_movie.state.dart';
import 'package:redux/redux.dart';

final latestMovieReducer = combineReducers<LatestMovieState>([
  TypedReducer<LatestMovieState, LatestMovieAction>(_loadMovieRequest),
  TypedReducer<LatestMovieState, LatestMovieSuccessAction>(_loadMovieResponse),
  TypedReducer<LatestMovieState, LatestMovieFailedAction>(_loadMovieError),
]);

LatestMovieState _loadMovieRequest(
        LatestMovieState state, LatestMovieAction action) =>
    state.copyWith(loading: true, error: "");

LatestMovieState _loadMovieResponse(
    LatestMovieState state, LatestMovieSuccessAction action) {
  print(action.movieList.results.length);
  print("+++++++++++++++++++++++++");
  final newState = LatestMovieState(false, "", action.movieList);
  return newState;
}

LatestMovieState _loadMovieError(
        LatestMovieState state, LatestMovieFailedAction action) =>
    state.copyWith(loading: false, error: action.error);
