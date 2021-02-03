import 'package:app_my_movies/common/constants/size_constants.dart';
import 'package:app_my_movies/common/screenutil/screenutil.dart';
import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_my_movies/common/extensions/size_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  MoviePageView({
    @required this.movies,
    @required this.initialPage,
  }) : assert(initialPage >= 0, 'initialPage cannot be less than 0');

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h,
      ),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        itemCount: widget.movies?.length ?? 0,
        controller: _pageController,
        pageSnapping: true,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieId: movie.id,
              posterPath: movie.posterPath,
            ),
          );
        },
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackDropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
