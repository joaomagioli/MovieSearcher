import 'dart:convert';
import 'package:movie_searcher/model/MovieList.dart';
import 'package:movie_searcher/repository/MovieRepository.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl implements MovieRepository {
  static const MOVIE_API_KEY = "6ec8f3ca7469a468ae7811745b363b15";
  static const BASE_URL = "https://api.themoviedb.org/3/movie/";

  @override
  Future<MovieList> fetchMovies(int pageNumber) async {
    http.Response response = await http.get(BASE_URL +
        "popular?api_key=" +
        MOVIE_API_KEY +
        "&page=" +
        pageNumber.toString());
    return _parseResponse(response.body);
  }

  MovieList _parseResponse(String response) {
    final parsed = json.decode(response);
    return MovieList.fromJson(parsed);
  }
}
