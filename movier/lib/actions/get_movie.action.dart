
import 'package:movier/models/detailed_movie.dart';

class GetMovieAction {
  final String id;

  const GetMovieAction({required this.id});

	@override
	String toString() {
	return 'GetMovieAction { }';
	}
}

class GetMovieSuccessAction {
	final DetailedMovie detailedMovie;

	GetMovieSuccessAction({required this.detailedMovie});
}

class GetMovieFailedAction {
	final String error;

	GetMovieFailedAction({required this.error});

	@override
	String toString() {
	return 'GetMovieFailedAction { error: $error }';
	}
}
	