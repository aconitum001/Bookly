import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.count,
  });

  final String rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
          size: 22,
        ),
        Text(
          rating.toLowerCase().replaceAll("_", " "),
          style: Styles.textStyle14,
        ),
        Text(
          " ($count)",
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}
