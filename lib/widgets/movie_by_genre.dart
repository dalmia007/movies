import 'package:flutter/material.dart';
import 'package:movies/models/genre_movie.dart';
import 'package:provider/provider.dart';

class MovieByGenre extends StatefulWidget {
  final int id;
  MovieByGenre({this.id});
  @override
  _MovieByGenreState createState() => _MovieByGenreState();
}

class _MovieByGenreState extends State<MovieByGenre> {
  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<List<GenreMovie>>(context);

    return movie == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original/' +
                              movie[index].poster,
                        ),
                      ),
                    ],
                  );
                }),
          );
  }
}
