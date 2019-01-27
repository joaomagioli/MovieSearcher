import 'package:movie_searcher/model/MovieList.dart';

abstract class MovieRepository {
  Future<MovieList> fetchMovies(int pageNumber);
}
