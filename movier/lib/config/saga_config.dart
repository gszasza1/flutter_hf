import 'package:movier/middleware/middlewares.dart';
import 'package:movier/reducers/appstate.state.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';

Store<AppState> configureStore() {
  final SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      applyMiddleware(sagaMiddleware),
    ],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(rootSaga);

  return store;
}