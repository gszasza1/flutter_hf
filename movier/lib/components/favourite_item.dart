import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/models/movie_result.dart';
import 'package:movier/selectors/favourie_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';

class FavouriteItemWidget extends StatelessWidget {
  const FavouriteItemWidget({Key? key, required this.movieResult})
      : super(key: key);

  final MovieResult movieResult;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavouriteMovieSelector>(
        converter: (store) => FavouriteMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/movie/${movieResult.id}',
              );
            },
            child: Container(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xfff3f3f3)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(movieResult.title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          movieResult.release_date,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Expanded(
                          child: IconButton(
                            onPressed: () =>
                                vm.deleteFavouriteMovie(movieResult.id),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.pink,
                              size: 24.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
