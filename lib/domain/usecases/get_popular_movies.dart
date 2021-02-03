import 'package:app_my_movies/domain/entities/app_error.dart';
import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/domain/entities/no_params.dart';
import 'package:app_my_movies/domain/repositories/movie_repository.dart';
import 'package:app_my_movies/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovies implements UseCase<List<MovieEntity>, NoParams> {
  final IMovieRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPopularMovies();
  }
}
