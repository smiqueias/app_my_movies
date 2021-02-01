import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'data/data_sources/movie_remote_data_source.dart';
import 'data/interfaces/movie_interface.dart';

main() {
  IMovieRemoteDataSource ds = MovieRemoteDataSourceImpl(Dio());
  ds.getTrendingByDay();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(),
    );
  }
}
