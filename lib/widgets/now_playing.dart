import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/screens/detail.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<List<Movie>>(context);

    return Container(
      height: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => (Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail(
                            selectedMovie: movie[index],
                          )))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original/' +
                          movie[index].backdrop,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.black.withOpacity(0.5),
                    )),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Text(
                    movie[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
