part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabbedChanged({
    int currentTabIndex,
    this.movies,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabbedError extends MovieTabbedState {
  const MovieTabbedError({
    int currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);
}
