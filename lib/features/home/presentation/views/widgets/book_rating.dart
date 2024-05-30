import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        ),
        const Text(
          "4.8",
          style: Styles.textStyle16,
        ),
        Text(
          " (2390)",
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}
