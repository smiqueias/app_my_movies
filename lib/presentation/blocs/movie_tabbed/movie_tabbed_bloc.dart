import 'dart:async';
import 'package:app_my_movies/domain/entities/app_error.dart';
import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/domain/entities/no_params.dart';
import 'package:app_my_movies/domain/usecases/get_coming_soon.dart';
import 'package:app_my_movies/domain/usecases/get_playing_now.dart';
import 'package:app_my_movies/domain/usecases/get_popular_movies.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopularMovies getPopularMovies;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc(
      {@required this.getComingSoon,
      @required this.getPlayingNow,
      @required this.getPopularMovies})
      : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;

      switch (event.currentIndex) {
        case 0:
          moviesEither = await getPopularMovies(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }

      yield moviesEither.fold(
        (l) => MovieTabbedError(currentTabIndex: event.currentIndex),
        (movies) => MovieTabbedChanged(
          currentTabIndex: event.currentIndex,
          movies: movies,
        ),
      );
    }
  }
}
