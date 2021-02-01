import 'package:app_my_movies/domain/entities/app_error.dart';
import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPlayingNow {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await repository.getPlayingNow();
  }
}