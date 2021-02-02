import 'package:app_my_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:app_my_movies/data/interfaces/movie_interface.dart';
import 'package:app_my_movies/data/repositories/movie_repository_impl.dart';
import 'package:app_my_movies/domain/repositories/movie_repository.dart';
import 'package:app_my_movies/domain/usecases/get_coming_soon.dart';
import 'package:app_my_movies/domain/usecases/get_playing_now.dart';
import 'package:app_my_movies/domain/usecases/get_popular_movies.dart';
import 'package:app_my_movies/domain/usecases/get_trending.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => Dio());

  locator.registerLazySingleton<IMovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      locator(),
    ),
  );

  locator.registerLazySingleton<IMovieRepository>(
    () => MovieRepositoryImpl(locator()),
  );

  locator.registerLazySingleton(
    () => GetTrending(locator()),
  );
}
