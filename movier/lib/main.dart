import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/pages/detailed_movie_page.dart';
import 'package:movier/pages/latest_movie_page.dart';
import 'package:redux/redux.dart';

import 'config/configure_web.dart'
    if (dart.library.html) 'config/configure_nonweb.dart';
import 'config/saga_config.dart';
import 'state/appstate.state.dart';

void main() {
  configureApp();
  runApp(Movier(store: configureStore()));
}

class Movier extends StatelessWidget {
  final Store<AppState> store;

  const Movier({required this.store}) : super();
  @override
  Widget build(BuildContext context) => StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Movie',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          // Handle '/'
          if (settings.name == '/') {
            return MaterialPageRoute(builder: (context) => const LatestMovie());
          }

          // Handle '/details/:id'
          final uri = Uri.parse(settings.name!);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'movie') {
            final id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (context) => DetailedMovie(id: id));
          }

          return MaterialPageRoute(builder: (context) => const LatestMovie());
        },
        home: const LatestMovie(),
      ));
}
