import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/detailed_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';

class DetailedMovie extends StatelessWidget {
  const DetailedMovie({Key? key}) : super(key: key);

  NetworkImage show(DetailedMovieSelector vm) {
    try {
      return NetworkImage(vm.detailedMovie.poster_path ??
          "https://imgflip.com/s/meme/Jackie-Chan-WTF.jpg");
    } catch (error) {
      return const NetworkImage(
          "https://imgflip.com/s/meme/Jackie-Chan-WTF.jpg");
    }
  }

  Container createItem(String title, String value, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(margin: const EdgeInsets.only(left: 10), child: Text(value))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('sliver-list');
    return StoreConnector<AppState, DetailedMovieSelector>(
        distinct: true,
        converter: (store) => DetailedMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return StatefulWrapper(
              onInit: () {
                vm.getMovieById("1");
              },
              child: SingleChildScrollView( child:
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          image: show(vm),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        vm.detailedMovie.title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFFf1f1f2),
                      child:
                          Text(vm.detailedMovie.overview ?? "No description"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Text(
                            "About",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    createItem(
                        "Release", vm.detailedMovie.release_date, context),
                    createItem("Popularity",
                        vm.detailedMovie.popularity.toString(), context),
                    createItem(
                        "Budget", "${vm.detailedMovie.budget} Dollar", context),
                    createItem("Total vote",
                        "${vm.detailedMovie.vote_count}", context),
                    createItem(
                        "Original Language",
                        "${vm.detailedMovie.original_language}",
                        context),
                    createItem("Revenue", "${vm.detailedMovie.revenue} Dollar",
                        context),
                    createItem("Imdb Id", "${vm.detailedMovie.imdb_id}",
                        context),
                    createItem("Status", "${vm.detailedMovie.status}",
                        context),
                  ],
                )
              ));
        });
  }
}
