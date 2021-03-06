import 'package:dio/dio.dart';
import 'package:movier/actions/latest_movie.action.dart';
import 'package:movier/extensions/json_mapper.dart';
import 'package:movier/models/movie_list.dart';
import 'package:movier/network/base.dart';
import 'package:redux_saga/redux_saga.dart';

// ignore: always_declare_return_types
getMovieList({dynamic action}) sync* {
  yield Try(() sync* {
    final mockdata = Result<MovieList>();
    yield Call(getData, result: mockdata);
    if (mockdata.value == null) {
      throw Exception(mockdata.toString());
    }
    yield Put(LatestMovieSuccessAction(movieList: mockdata.value as MovieList));
  }, Catch: (e, s) sync* {
    yield Put(LatestMovieFailedAction(error: e.toString()));
  });
}

// ignore: always_declare_return_types
// ignore: type_annotate_public_apis
getMovieListSaga() sync* {
  yield TakeEvery(getMovieList, pattern: LatestMovieAction);
}

Future<MovieList> getMockData() async =>
    parseJsonFromAssets('mock/movie_list.mock.json')
        .then((value) => MovieList.fromJson(value));

Future getData() async {
  final Response response = await DioFactory()
      .get('/movie/popular');
  return MovieList.fromJson(response.data as Map<String, dynamic>);
}
