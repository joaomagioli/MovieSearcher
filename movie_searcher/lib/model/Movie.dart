class Movie {
  final String title, posterPath, id, overview, voteAverage;
  final bool favored;

  Movie(
      {this.title,
      this.posterPath,
      this.id,
      this.overview,
      this.voteAverage,
      this.favored});

  factory Movie.fromJson(Map json) {
    return Movie(
        title: json['title'],
        posterPath: json['poster_path'],
        id: json['id'].toString(),
        overview: json['overview'],
        voteAverage: json['vote_average'],
        favored: false);
  }
}
