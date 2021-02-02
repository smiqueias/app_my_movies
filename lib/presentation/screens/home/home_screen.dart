import 'package:app_my_movies/data/data_sources/movie_remote_data_source.dart';
import 'package:app_my_movies/data/repositories/movie_repository_impl.dart';
import 'package:app_my_movies/domain/usecases/get_trending.dart';
import 'package:app_my_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:app_my_movies/presentation/blocs/movies_carousel/movie_carousel_bloc.dart';
import 'package:app_my_movies/presentation/screens/home/movie_carousel/movie_carousel_widgets.dart';
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

    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
      ],
      child: Scaffold(
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
                    child: Placeholder(
                      color: Colors.red,
                    ),
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
