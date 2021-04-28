import 'package:movier/reducers/favourite_movies.reducer.dart';
import 'package:movier/reducers/get_movie.reducer.dart';
import 'package:movier/reducers/latest_movie.reducer.dart';
import 'package:movier/state/appstate.state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      getMovieState: getmovieReducer(state.getMovieState, action),
      favouriteMovieState:
          favouritemoviesReducer(state.favouriteMovieState, action),
      latestMovieState: latestMovieReducer(state.latestMovieState, action));
}
