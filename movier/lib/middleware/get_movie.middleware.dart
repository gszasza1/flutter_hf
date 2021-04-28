
import 'package:movier/actions/get_movie.action.dart';

import 'package:redux_saga/redux_saga.dart';

getMovie({dynamic action}) sync* {
  yield Try(() sync* {
    var user = Result();
    yield Call(Api.fetchUser, args: [action.payload.userId], result: user);
    yield Put(GetMovieSuccessAction(user: user.value));
  }, Catch: (e, s) sync* {
    yield Put(GetMovieFailedAction(error: e.message.toString()));
  });
}

getMovieSaga() sync* {
  yield TakeEvery(fetchUser, pattern: GetMovieAction);
}
