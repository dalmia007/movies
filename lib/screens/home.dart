import 'package:flutter/material.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/widgets/movie_by_genre.dart';
import 'package:movies/widgets/genres_list.dart';
import 'package:movies/widgets/now_playing.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<List<Movie>>(context);
    var genres = Provider.of<List<Genre>>(context);

    return Material(
        child: Container(
      color: Colors.black87,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: (data == null || genres == null)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: NowPlaying(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      child: GenreList(),
                    ),
                    SizedBox(height: 10),
                    MovieByGenre(),
                  ],
                ),
              ),
      ),
    ));
  }
}
