import 'package:movier/middleware/get_movie.middleware.dart';
import 'package:movier/middleware/latest_movie.middleware.dart';
import 'package:movier/middleware/search_movie.middleware.dart';
import 'package:redux_saga/redux_saga.dart';

rootSaga() sync* {
  yield All({
    getMovieSaga: Fork(getMovieSaga),
    getMovieListSaga: Fork(getMovieListSaga),
    searchMovieListSaga: Fork(searchMovieListSaga),
  });
}
