import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movier/config/api_config.dart';
import 'package:movier/extensions/stateful_wrapper.dart';
import 'package:movier/selectors/detailed_movie.selector.dart';
import 'package:movier/state/appstate.state.dart';

class DetailedMovie extends StatelessWidget {
  const DetailedMovie({Key? key, required this.id}) : super(key: key);
  final int id;
  CachedNetworkImage show(DetailedMovieSelector vm) {
    final resolver = CachedNetworkImage(
        imageUrl: "https://imgflip.com/s/meme/Jackie-Chan-WTF.jpg",
        imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                image: imageProvider,
              ),
            )));
    try {
      String imageUrl = "";
      if (vm.detailedMovie.poster_path != null &&
          vm.detailedMovie.poster_path!.isNotEmpty) {
        imageUrl =
            "https://api.themoviedb.org/3${vm.detailedMovie.poster_path}?api_key=${API_KEY}";
      } else {
        throw Exception("Empty image url");
      }
      return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => resolver,
          errorWidget: (context, url, error) => resolver,
          imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  image: imageProvider,
                ),
              )));
    } catch (error) {
      return resolver;
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
    return StoreConnector<AppState, DetailedMovieSelector>(
        converter: (store) => DetailedMovieSelector.fromStore(store, id),
        builder: (context, vm) {
          return StatefulWrapper(
              onInit: () {
                vm.getMovieById(id);
              },
              child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          alignment: Alignment.topCenter,
                          child: show(vm)),
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
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "About",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            if (vm.inList)
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  tooltip: 'Add to favourite',
                                  onPressed: () {
                                    vm.addFavouriteMovie(vm.detailedMovie);
                                  },
                                ),
                              )
                          ],
                        ),
                      ),
                      createItem(
                          "Release", vm.detailedMovie.release_date, context),
                      createItem("Popularity",
                          vm.detailedMovie.popularity.toString(), context),
                      createItem("Budget", "${vm.detailedMovie.budget} Dollar",
                          context),
                      createItem("Total vote", "${vm.detailedMovie.vote_count}",
                          context),
                      createItem("Original Language",
                          "${vm.detailedMovie.original_language}", context),
                      createItem("Revenue",
                          "${vm.detailedMovie.revenue} Dollar", context),
                      createItem(
                          "Imdb Id", "${vm.detailedMovie.imdb_id}", context),
                      createItem(
                          "Status", "${vm.detailedMovie.status}", context),
                    ],
                  ))));
        });
  }
}
