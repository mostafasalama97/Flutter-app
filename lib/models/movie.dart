class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  bool isNowPlaying() {
    final now = DateTime.now();
    return releaseDate.isAfter(now) || releaseDate.isAtSameMomentAs(now);
  }

  bool isPopular() => voteAverage >= 5.0;
}
