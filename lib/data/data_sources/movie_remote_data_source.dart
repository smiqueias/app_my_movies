import 'package:app_my_movies/data/core/api_constants.dart';
import 'package:app_my_movies/data/interfaces/movie_interface.dart';
import 'package:app_my_movies/data/models/movie_model.dart';
import 'package:app_my_movies/data/models/movie_trending_model.dart';
import 'package:dio/dio.dart';


class MovieRemoteDataSourceImpl implements IMovieRemoteDataSource {
  final Dio _dio;

  MovieRemoteDataSourceImpl(this._dio);

  @override
  Future<List<MovieModel>> getTrendingByDay() async {
    final response = await _dio.get(
      '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      print(moviesTrendingModelFromJson(response.data).movies);
    } else {
      throw Exception(response.statusMessage);
    }

  }
}
