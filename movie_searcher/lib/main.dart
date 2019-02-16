import 'package:flutter/material.dart';
import 'screens/MoviesListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Searcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesList(),
    );
  }
}
