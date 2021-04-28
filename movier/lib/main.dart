import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/pages/detailed_movie_page.dart';
import 'package:redux/redux.dart';
import 'config/saga_config.dart';
import 'pages/home-page.dart';
import 'state/appstate.state.dart';

void main() {
  runApp(Movier(store: configureStore()));
}

class Movier extends StatelessWidget {
  final Store<AppState> store;

  Movier({required this.store}) : super();
  @override
  Widget build(BuildContext context) => StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Movie',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(body: const DetailedMovie()),
      ));
}
