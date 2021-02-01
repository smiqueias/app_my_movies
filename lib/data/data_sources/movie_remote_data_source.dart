import 'package:app_my_movies/data/core/api_constants.dart';
import 'package:app_my_movies/data/interfaces/movie_interface.dart';
import 'package:app_my_movies/data/models/movie_model.dart';
import 'package:app_my_movies/data/models/movie_trending_model.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSourceImpl implements IMovieRemoteDataSource {
  final Dio _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrendingByDay() async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final movies = moviesTrendingModelFromJson(response.data).movies;
      print(movies);
      return movies;
    } else {
      throw Exception('API Trending By Day error => $response.statusMessage');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}/movie/popular?api_key=${ApiConstants.API_KEY}',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final movies = moviesTrendingModelFromJson(response.data).movies;
      print(movies);
      return movies;
    } else {
      throw Exception('API Popular Movies error => $response.statusMessage');
    }
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}movie/upcoming?api_key=${ApiConstants.API_KEY}&language=en-US&page=1',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final movies = moviesTrendingModelFromJson(response.data).movies;
      print(movies);
      return movies;
    } else {
      throw Exception('API Coming Soon error => $response.statusMessage');
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}movie/now_playing?api_key=${ApiConstants.API_KEY}&language=pt-BR&page=1',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final movies = moviesTrendingModelFromJson(response.data).movies;
      print(movies);
      return movies;
    } else {
      throw Exception('API Playing Now error => $response.statusMessage');
    }
  }
}
