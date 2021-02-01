import 'dart:convert';
import 'movie_model.dart';


MoviesTrendingModel moviesTrendingModelFromJson(var data) => MoviesTrendingModel.fromJson(data);

String moviesTrendingModelToJson(MoviesTrendingModel data) => json.encode(data.toJson());

class MoviesTrendingModel {
    MoviesTrendingModel({
        this.page,
        this.movies,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<MovieModel> movies;
    int totalPages;
    int totalResults;

    factory MoviesTrendingModel.fromJson(Map<String, dynamic> json) => MoviesTrendingModel(
        page: json["page"],
        movies: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(movies.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}



enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE
});

enum OriginalLanguage { EN, ES }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
