import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class Detail extends StatelessWidget {
  final Movie selectedMovie;

  Detail({this.selectedMovie});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Color(0xff00010a),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/' +
                        selectedMovie.backdrop,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .27,
                left: 15,
                right: 15,
                child: Card(
                  elevation: 10,
                  color: Color(0xff01021f),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/original/' +
                                    selectedMovie.poster,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (selectedMovie.title),
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                ('(' +
                                        selectedMovie.year
                                            .toString()
                                            .substring(0, 4) +
                                        ')')
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
