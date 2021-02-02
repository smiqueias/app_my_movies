import 'package:app_my_movies/common/constants/size_constants.dart';
import 'package:app_my_movies/common/screenutil/screenutil.dart';
import 'package:app_my_movies/presentation/screens/home/movie_carousel/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_my_movies/common/extensions/size_extensions.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final PageController pageController;
  final String posterPath;

  const AnimatedMovieCardWidget({
    Key key,
    @required this.index,
    @required this.pageController,
    @required this.posterPath,
    @required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;

        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
