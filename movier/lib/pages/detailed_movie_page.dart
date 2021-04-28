import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/detailed_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';

class DetailedMovie extends StatelessWidget {
  const DetailedMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return StoreConnector<AppState, DetailedMovieSelector>(
      distinct: true,
      converter: DetailedMovieSelector.fromStore,
      builder: (context, vm) {
         return StatefulWrapper(
      onInit: () {
        vm.getMovieById("1");
      },
      child: 
        Text(vm.detailedMovie.title,
              style: Theme.of(context).textTheme.headline4)
          );
      }
   );
  }
  
}
