import 'package:app_my_movies/data/core/api_constants.dart';
import 'package:app_my_movies/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      widthFactor: 1,
      child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
        builder: (context, state) {
          if (state is MovieBackdropChanged) {
            return FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.7,
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                fit: BoxFit.fitHeight,
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
