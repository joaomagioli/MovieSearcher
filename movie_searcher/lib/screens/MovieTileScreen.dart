import 'package:flutter/material.dart';
import 'package:movie_searcher/model/MovieList.dart';
import 'package:movie_searcher/model/Movie.dart';
import 'package:movie_searcher/utils/MovieLoadMoreStatus.dart';
import 'package:async/async.dart';
import 'package:flutter_image/network.dart';

const String IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185";

class MovieTileScreen extends StatefulWidget {
  final MovieList moviesList;

  MovieTileScreen({Key key, this.moviesList});

  @override
  State<StatefulWidget> createState() => MovieTileScreenState();
}

class MovieTileScreenState extends State<MovieTileScreen> {
  MovieLoadMoreStatus loadMoreStatus = MovieLoadMoreStatus.STABLE;
  final ScrollController scrollController = ScrollController();
  List<Movie> movies;
  int currentPageNumber;
  CancelableOperation movieOperation;

  @override
  void initState() {
    movies = widget.moviesList.movies;
    currentPageNumber = widget.moviesList.page;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    if (movieOperation != null) movieOperation.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.85),
      controller: scrollController,
      itemCount: movies.length,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return MovieSingleTileScreen(movie: movies[index]);
      },
    ));
  }
}

class MovieSingleTileScreen extends StatelessWidget {

  final Movie movie;

  MovieSingleTileScreen({this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Image(image: NetworkImageWithRetry(IMAGE_BASE_URL + movie.posterPath),),
          Align()
        ],
      ),
    );
  }
}
