import 'package:app_my_movies/domain/entities/movie_entity.dart';
import 'package:app_my_movies/presentation/screens/home/movie_tabbed/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_my_movies/common/extensions/size_extensions.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: movies.length,
        separatorBuilder: (context, _) {
          return SizedBox(
            width: 14.w,
          );
        },
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];

          return MovieTabCardWidget(
            movieID: movie.id.toString(),
            title: movie.title,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}
