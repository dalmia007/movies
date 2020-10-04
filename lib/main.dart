import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/repository/movie_repo.dart';
import 'package:movies/screens/home.dart';
import 'package:movies/widgets/movie_by_genre.dart';
import 'package:provider/provider.dart';

void main() async {
  await DotEnv().load('assets/.env');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
        providers: [
          FutureProvider(
            create: (_) => MovieRepo().getNowPlayingMovies(),
          ),
          FutureProvider(
            create: (_) => MovieRepo().getGenres(),
          ),
          FutureProvider(
            create: (_) => MovieRepo().getMoviesByGenre((MovieByGenre().id)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Home(),
              ),
            ),
            resizeToAvoidBottomInset: false,
          ),
        ));
  }
}
