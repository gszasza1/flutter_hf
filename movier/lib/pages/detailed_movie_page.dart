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
        converter: (store) => DetailedMovieSelector.fromStore(
              store,
            ),
        builder: (context, vm) {
          return StatefulWrapper(
              onInit: () {
                vm.getMovieById("1");
              },
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        image: NetworkImage("https://picsum.photos/250?image=9"),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(vm.detailedMovie.title,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      fontSize: 24,
                      
                      fontWeight: FontWeight.bold),
                    
                    ),
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(vm.detailedMovie.overview ?? "No description"),
                   color: Color(0xFFf1f1f2),
                  )
                ],
              ));
        });
  }
}

String show(DetailedMovieSelector vm) {
  var sajt = vm.detailedMovie.poster_path ?? "";
  print(sajt);
  return "https://picsum.photos/250?image=9";
}
