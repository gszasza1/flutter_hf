import 'package:movier/models/detailed_movie.dart';
import 'package:movier/models/movie_result.dart';

class Converter {
  static MovieResult movieResultToDetailedMovie(DetailedMovie detailedMovie) {
    return MovieResult(
        detailedMovie.poster_path ?? "",
        detailedMovie.adult,
        detailedMovie.overview ?? "",
        detailedMovie.release_date,
        detailedMovie.genres.map((e) => e.id).toList(),
        detailedMovie.id,
        detailedMovie.original_title ?? "",
        detailedMovie.original_language ?? "",
        detailedMovie.title,
        detailedMovie.backdrop_path ?? "",
        detailedMovie.popularity,
        detailedMovie.vote_count,
        detailedMovie.video,
        detailedMovie.vote_average);
  }
}
