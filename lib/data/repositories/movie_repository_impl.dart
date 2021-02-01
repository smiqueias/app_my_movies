
import 'package:app_my_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:app_my_movies/domain/entities/app_error.dart';
import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {

  final MovieRemoteDataSourceImpl remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieEntity>>> getTrending() async {
    try {
      final moviesTrending = await remoteDataSource.getTrendingByDay();
      return Right(moviesTrending);
    } on Exception {
      return Left(AppError('Somenthing went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final moviesComingSoon = await remoteDataSource.getComingSoon();
      return Right(moviesComingSoon);
    } on Exception {
      return Left(AppError('Somenthing went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final moviesPlayingNow = await remoteDataSource.getPlayingNow();
      return Right(moviesPlayingNow);
    } on Exception {
      return Left(AppError('Somenthing went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopularMovies() async {
    try {
      final moviesPopular = await remoteDataSource.getPopularMovies();
      return Right(moviesPopular);
    } on Exception {
      return Left(AppError('Somenthing went wrong'));
    }
  }
  
}