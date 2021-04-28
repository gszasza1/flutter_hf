import 'package:movier/middleware/middlewares.dart';
import 'package:movier/reducers/appstate.state.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_logging/redux_logging.dart';

Store<AppState> configureStore() {
  final SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = DevToolsStore<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [applyMiddleware(sagaMiddleware), LoggingMiddleware.printer()],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(rootSaga);

  return store;
}
