class Movie {
  final String id;
  final String title, posterPath, overview;
  final String voteAverage;
  final bool favored;

  Movie(
      {this.title,
      this.posterPath,
      this.id,
      this.overview,
      this.voteAverage,
      this.favored});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        posterPath: json['poster_path'],
        id: json['id'].toString(),
        overview: json['overview'],
        voteAverage: json['vote_average'].toString(),
        favored: false);
  }
}
