import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final String releaseDate;
  final String overview;
  final int id;
  final num voteAverage;

  MovieEntity({
    @required this.backdropPath,
    @required this.posterPath,
    @required this.title,
    @required this.releaseDate,
    @required this.overview,
    @required this.id,
    @required this.voteAverage,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [title, id];

  @override
  bool get stringify => true;
  
}
