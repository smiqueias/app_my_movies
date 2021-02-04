import 'package:app_my_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:app_my_movies/data/repositories/movie_repository_impl.dart';
import 'package:app_my_movies/domain/usecases/get_coming_soon.dart';
import 'package:app_my_movies/domain/usecases/get_playing_now.dart';
import 'package:app_my_movies/domain/usecases/get_popular_movies.dart';
import 'package:app_my_movies/domain/usecases/get_trending.dart';
import 'package:app_my_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:app_my_movies/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:app_my_movies/presentation/blocs/movies_carousel/movie_carousel_bloc.dart';
import 'package:app_my_movies/presentation/screens/drawer/navegation_drawer.dart';
import 'package:app_my_movies/presentation/screens/home/movie_carousel/movie_carousel_widgets.dart';
import 'package:app_my_movies/presentation/screens/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = MovieCarouselBloc(
      getTrending: GetTrending(
        MovieRepositoryImpl(
          MovieRemoteDataSourceImpl(
            Dio(),
          ),
        ),
      ),
    );

    movieBackdropBloc = MovieBackdropBloc();

    movieTabbedBloc = MovieTabbedBloc(
      getComingSoon: GetComingSoon(
        MovieRepositoryImpl(
          MovieRemoteDataSourceImpl(
            Dio(),
          ),
        ),
      ),
      getPlayingNow: GetPlayingNow(
        MovieRepositoryImpl(
          MovieRemoteDataSourceImpl(
            Dio(),
          ),
        ),
      ),
      getPopularMovies: GetPopularMovies(
        MovieRepositoryImpl(
          MovieRemoteDataSourceImpl(
            Dio(),
          ),
        ),
      ),
    );

    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
      ],
      child: Scaffold(
        drawer: const NavegationDrawer(), 
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  )
                ],
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
