import 'package:app_my_movies/domain/entities/movie_entity.dart';

import 'movie_trending_model.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.releaseDate,
    this.title,
    this.id,
    this.popularity,
    this.mediaType,
  }) : super(
            backdropPath: backdropPath,
            id: id,
            overview: overview,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage);

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final OriginalLanguage originalLanguage;
  final String originalTitle;
  final String posterPath;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String overview;
  final String releaseDate;
  final String title;
  final int id;
  final double popularity;
  final MediaType mediaType;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        id: json["id"],
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        mediaType: mediaTypeValues.map[json["media_type"]],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "poster_path": posterPath,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "overview": overview,
        "title": title,
        "id": id,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
      };
}
