import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/components/favourite_item.dart';
import 'package:movier/components/single_bottom_navigation.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/favourie_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';
import 'package:movier/extensions/debounce.dart';

class FavouriteMovie extends StatelessWidget {
  FavouriteMovie({Key? key}) : super(key: key);
  final _debouncer = Debounce(const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavouriteMovieSelector>(
        converter: (store) => FavouriteMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return StatefulWrapper(
              onDispose: () {
                _debouncer.dispose();
              },
              child: Scaffold(
                  bottomNavigationBar: SingleBottomNavigation(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/',
                      );
                    },
                    icon: Icon(Icons.list),
                  ),
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(children: [
                        TextFormField(
                            onChanged: (e) => _debouncer
                                .call(() => vm.searchFavouriteMovie(e))),
                        Flexible(
                            child: SingleChildScrollView(
                                child: ListView(
                                    shrinkWrap: true,
                                    children: vm.favouriteList.map((e) {
                                      return FavouriteItemWidget(
                                          movieResult: e);
                                    }).toList()))),
                      ]))));
        });
  }
}
