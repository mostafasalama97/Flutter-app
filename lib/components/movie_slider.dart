// ignore_for_file: overridden_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  @override
  final Key? key;
  final void Function(Movie movie) onMovieTap;

  const MovieSlider({required this.movies, this.key, required this.onMovieTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () => onMovieTap(movies[index]),
                  child: MovieCard(movie: movies[index]),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
