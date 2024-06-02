import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: const CustomBookImage(
              image:
                  "https://books.google.com/books/content?id=9GwrmHRl490C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
        ),
        const SizedBox(
          height: 38,
        ),
        const Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Rudyard Kipking",
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.7),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const BookRating(),
        const SizedBox(
          height: 37,
        ),
        const BooksAction(),
      ],
    );
  }
}
