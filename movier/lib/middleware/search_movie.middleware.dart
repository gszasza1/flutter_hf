import 'package:dio/dio.dart';
import 'package:movier/actions/search_movie.action.dart';
import 'package:movier/extensions/json_mapper.dart';
import 'package:movier/models/movie_list.dart';
import 'package:movier/network/base.dart';
import 'package:redux_saga/redux_saga.dart';

// ignore: always_declare_return_types
searchMovieList({required SearchMovieAction action}) sync* {
  yield Try(() sync* {
    final data = Result<MovieList>();
    yield Call(getData, args: [action.searchText], result: data);
    if (data.value == null) {
      throw Exception(data.toString());
    }
    yield Put(SearchMovieSuccessAction(movieList: data.value as MovieList));
  }, Catch: (e, s) sync* {
    print(s.toString());
    yield Put(SearchMovieFailedAction(error: e.toString()));
  });
}

// ignore: always_declare_return_types
// ignore: type_annotate_public_apis
searchMovieListSaga() sync* {
  yield TakeEvery(searchMovieList, pattern: SearchMovieAction);
}

Future<MovieList> getMockData() async =>
    parseJsonFromAssets('mock/movie_list.mock.json')
        .then((value) => MovieList.fromJson(value));

Future getData(String query) async {
  final Response response = await DioFactory()
      .get('/search/movie', queryParameters: {
    'query': query
  });
  return MovieList.fromJson(response.data as Map<String, dynamic>);
}
