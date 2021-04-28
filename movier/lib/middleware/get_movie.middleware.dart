
import 'package:movier/actions/get_movie.action.dart';
import 'package:movier/extensions/json_mapper.dart';
import 'package:movier/models/detailed_movie.dart';

import 'package:redux_saga/redux_saga.dart';


// ignore: always_declare_return_types
getMovie({dynamic action}) sync* {
  yield Try(() sync* {
    print("sajt");
  //  yield Call(Api.fetchUser, args: [action.payload.userId], result: user);
   final mockdata = getMockData();
   // yield Delay(const Duration(seconds: 3));
   if(mockdata == null){
     throw Exception("null érték");
   }
    yield Put(GetMovieSuccessAction(detailedMovie: mockdata));
  }, Catch: (e, s) sync* {
    yield Put(GetMovieFailedAction(error: e.message.toString()));
  });
}

// ignore: always_declare_return_types
// ignore: type_annotate_public_apis
getMovieSaga() async* {
  yield TakeEvery(getMovie, pattern: GetMovieAction);
}

DetailedMovie? getMockData(){
final Future<Map<String, dynamic>> dmap = parseJsonFromAssets('"mock/detailed_movie.mock.json"');
dmap.then((value) => DetailedMovie.fromJson(value));

}