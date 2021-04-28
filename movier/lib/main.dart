import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/reducers/appstate.state.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'config/saga_config.dart';
import 'middleware/middlewares.dart';
import 'pages/home-page.dart';
import 'state/appstate.state.dart';
void main() {
  runApp(Movier(store: configureStore()));
}
class Movier extends StatelessWidget {
  final Store<AppState> store;

  Movier({@required this.store}) : super();
  @override
  Widget build(BuildContext context)=> StoreProvider(
      store: store,
      child: MaterialApp(
      title: 'Movie',
      theme: ThemeData(
        primarySwatch: Colors.green,        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: 'Latest Movie list'),
    )
    );
  }
