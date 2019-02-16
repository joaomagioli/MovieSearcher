import 'package:flutter/material.dart';
import 'package:movie_searcher/model/MovieList.dart';
import 'package:movie_searcher/screens/MovieTileScreen.dart';
import 'package:movie_searcher/repository/MovieRepositoryImpl.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final movieRepository = MovieRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieList>(
      future: movieRepository.fetchMovies(1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MovieTileScreen(moviesList: snapshot.data);
        } else if (snapshot.hasError) {
          return Text('Not working');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
