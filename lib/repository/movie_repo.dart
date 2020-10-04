import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/genre_movie.dart';
import 'package:movies/models/movie.dart';

String apiKey = DotEnv().env['API_KEY'];

class MovieRepo extends ChangeNotifier {
  static String url = 'https://api.themoviedb.org/3/';

  Future<List<Movie>> getNowPlayingMovies() async {
    http.Response response =
        await http.get(url + 'movie/now_playing?api_key=' + apiKey);
    var jsonResponse = jsonDecode(response.body)['results'] as List;
    return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Genre>> getGenres() async {
    http.Response response = await http
        .get('https://api.themoviedb.org/3/genre/movie/list?api_key=' + apiKey);
    var jsonResponse = jsonDecode(response.body)['genres'] as List;
    return jsonResponse.map((genre) => Genre.fromJson(genre)).toList();
  }

  Future<List<GenreMovie>> getMoviesByGenre(int id) async {
    if (id == null) {
      http.Response response = await http.get(
          'https://api.themoviedb.org/3/discover/movie?api_key=' +
              apiKey +
              '&with_genres=28');
      var jsonResponse = jsonDecode(response.body)['results'] as List;
      return jsonResponse.map((movie) => GenreMovie.fromJson(movie)).toList();
    } else {
      http.Response response = await http.get(
          'https://api.themoviedb.org/3/discover/movie?api_key=' +
              apiKey +
              '&with_genres=' +
              id.toString());
      var jsonResponse = jsonDecode(response.body)['results'] as List;
      return jsonResponse.map((movie) => GenreMovie.fromJson(movie)).toList();
    }
  }
}
