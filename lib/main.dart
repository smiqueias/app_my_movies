import 'package:app_my_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:app_my_movies/domain/repositories/movie_repository.dart';
import 'package:app_my_movies/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'data/data_sources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'package:dio/dio.dart';

import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';

Future<void> main() async {
  MovieRepository movieRepository =
      MovieRepositoryImpl(MovieRemoteDataSourceImpl(Dio()));

  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending();
  eitherResponse.fold(
    (l) {
      print('error');
      print(l);
    },
    (r) {
      print('list of movies');
      print(r);
    },
  );

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
