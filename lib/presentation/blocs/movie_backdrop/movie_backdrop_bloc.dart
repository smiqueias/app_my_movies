import 'dart:async';

import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial());

  @override
  Stream<MovieBackdropState> mapEventToState(
    MovieBackdropEvent event,
  ) async* {
    yield MovieBackdropChanged(
      (event as MovieBackDropChangedEvent).movie,
    );
  }
}
