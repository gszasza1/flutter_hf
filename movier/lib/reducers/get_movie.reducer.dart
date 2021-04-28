import 'package:movier/actions/get_movie.action.dart';
import 'package:movier/state/get_movie.state.dart';
import 'package:redux/redux.dart';

final getmovieReducer = combineReducers<GetMovieState>([
  TypedReducer<GetMovieState, GetMovieAction>(_loadMovieRequest),
  TypedReducer<GetMovieState, GetMovieSuccessAction>(_loadMovieResponse),
  TypedReducer<GetMovieState, GetMovieFailedAction>(_loadMovieError),
]);

GetMovieState _loadMovieRequest(GetMovieState state, GetMovieAction action) =>
    state.copyWith(loading: true, error: "");

GetMovieState _loadMovieResponse(
    GetMovieState state, GetMovieSuccessAction action) {
  final newState = state.copyWith(
      loading: false, detailedMovie: action.detailedMovie, error: "");
  return newState;
}

GetMovieState _loadMovieError(
        GetMovieState state, GetMovieFailedAction action) =>
    state.copyWith(loading: false, error: action.error);
