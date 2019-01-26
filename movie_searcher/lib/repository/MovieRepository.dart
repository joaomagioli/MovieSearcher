import 'package:movie_searcher/model/Movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(int pageNumber);
}
