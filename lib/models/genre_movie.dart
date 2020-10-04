class GenreMovie {
  final int id;
  final String title;
  final String backdrop;
  final String poster;
  final String overview;
  final double rating;
  final List genre;

  GenreMovie({
    this.id,
    this.title,
    this.backdrop,
    this.poster,
    this.overview,
    this.rating,
    this.genre,
  });

  factory GenreMovie.fromJson(Map<String, dynamic> parsedJson) {
    return GenreMovie(
      id: parsedJson['id'],
      title: parsedJson['title'],
      backdrop: parsedJson['backdrop_path'],
      poster: parsedJson['poster_path'],
      overview: parsedJson['overview'],
      rating: parsedJson['vote_average'] + 0.0,
      genre: parsedJson['genre_ids'],
    );
  }
}
