import 'package:flutter/material.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/repository/movie_repo.dart';
import 'package:provider/provider.dart';

class GenreList extends StatefulWidget {
  final int id;
  GenreList({this.id});
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  @override
  Widget build(BuildContext context) {
    var genres = Provider.of<List<Genre>>(context);

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (context, index) {
        return ActionChip(
          label: Text(genres[index].name),
          onPressed: () {
            MovieRepo().getMoviesByGenre(genres[index].id);
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 5),
    );
  }
}
