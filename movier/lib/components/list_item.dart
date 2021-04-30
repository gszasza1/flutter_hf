import 'package:flutter/material.dart';
import 'package:movier/models/movie_result.dart';
import 'package:movier/pages/detailed_movie_page.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key, required this.movieResult}) : super(key: key);

  final MovieResult movieResult;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/movie/${movieResult.id}',
        );
      },
      child: Container(
          padding:
              const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Color(0xFFFFF3F3F3)),
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
              Container(
                  child: Row(
                children: [
                  Expanded(
                      child: Text(
                    movieResult.release_date,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Expanded(
                      child: Text(
                    movieResult.popularity.toString(),
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ))
            ],
          )),
    );
  }
}
