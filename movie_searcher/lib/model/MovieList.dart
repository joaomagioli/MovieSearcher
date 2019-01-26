import 'package:movie_searcher/model/Movie.dart';

class MovieList {
  final int page, totalResults, totalPages;
  final List<Movie> movies;

  MovieList({this.page, this.totalResults, this.totalPages, this.movies});

  factory MovieList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> moviesList = list.map((movie) => Movie.fromJson(movie));

    return MovieList(
        page: json['page'],
        totalResults: json['total_results'],
        totalPages: json['total_pages'],
        movies: moviesList);
  }
}
