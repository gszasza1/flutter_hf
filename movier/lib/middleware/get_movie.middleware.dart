
import 'package:movier/actions/get_movie.action.dart';
import 'package:movier/extensions/json_mapper.dart';
import 'package:movier/models/detailed_movie.dart';

import 'package:redux_saga/redux_saga.dart';


// ignore: always_declare_return_types
getMovie({dynamic action}) sync* {
  yield Try(() sync* {
    final mockdata = Result<DetailedMovie>();
    yield Call(getMockData, result: mockdata);
   yield Delay(const Duration(seconds: 1));
   if(mockdata.value == null){
     throw Exception(mockdata.toString());
   }
    yield Put(GetMovieSuccessAction(detailedMovie: mockdata.value as DetailedMovie));
  }, Catch: (e, s) sync* {
    yield Put(GetMovieFailedAction(error: e.toString()));
  });
}

// ignore: always_declare_return_types
// ignore: type_annotate_public_apis
getMovieSaga() sync* {
  yield TakeEvery(getMovie, pattern: GetMovieAction);
}

Future<DetailedMovie> getMockData() async => await parseJsonFromAssets('mock/detailed_movie.mock.json').then((value) => DetailedMovie.fromJson(value));