import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/presentation/widgets/movei_app_bar.dart';
import 'package:app_my_movies/presentation/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'movie_backdrop_carousel_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
    @required this.defaultIndex,
  }) : assert(
          defaultIndex >= 0,
          'defaultIndex cannot be less than 0',
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
