class Movie {
  final int id;
  final String title;
  final String backdrop;
  final String poster;
  final String overview;
  final double rating;
  final List genre;
  final String year;

  Movie({
    this.id,
    this.title,
    this.backdrop,
    this.poster,
    this.overview,
    this.rating,
    this.genre,
    this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson['id'],
      title: parsedJson['title'],
      backdrop: parsedJson['backdrop_path'],
      poster: parsedJson['poster_path'],
      overview: parsedJson['overview'],
      rating: parsedJson['vote_average'] + 0.0,
      genre: parsedJson['genre_ids'],
      year: parsedJson['release_date'],
    );
  }
}
