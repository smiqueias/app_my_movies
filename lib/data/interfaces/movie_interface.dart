import 'package:app_my_movies/data/models/movie_model.dart';

abstract class IMovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingByDay();
}