import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/components/single_bottom_navigation.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/latest_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:movier/components/list_item.dart';
import 'package:movier/extensions/debounce.dart';

class LatestMovie extends StatelessWidget {
  LatestMovie({Key? key}) : super(key: key);
  final _debouncer = Debounce(const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LatestMovieSelector>(
        converter: (store) => LatestMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return StatefulWrapper(
              onDispose: () {
                _debouncer.dispose();
              },
              onInit: () {
                return vm.getLatestMovieList();
              },
              child: Scaffold(
                  bottomNavigationBar: SingleBottomNavigation(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/favourite',
                      );
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(children: [
                        TextFormField(
                            onChanged: (e) => _debouncer
                                .call(() => vm.onMovieSearchChange(e))),
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
