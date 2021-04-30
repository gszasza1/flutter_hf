import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/latest_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:movier/components/list_item.dart';

class LatestMovie extends StatelessWidget {
  const LatestMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LatestMovieSelector>(
        converter: (store) => LatestMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return StatefulWrapper(
              onInit: () {
                return vm.getLatestMovieList();
              },
              child: Scaffold(
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(children: [
                        TextFormField(
                            autofocus: true,
                            onChanged: (e) => vm.onMovieSearchChange(e)),
                        Flexible(
                            child: SingleChildScrollView(
                                child: ListView(
                                    shrinkWrap: true,
                                    children: vm.movieList.map((e) {
                                      return ListItemWidget(movieResult: e);
                                    }).toList()))),
                      ]))));
        });
  }
}
