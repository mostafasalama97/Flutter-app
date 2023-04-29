import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget {
  final double rating;

  const RatingStar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 24.0,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color.fromARGB(255, 206, 155, 5),
      ),
      onRatingUpdate: (double value) {},
    );
  }
}
