import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/utils/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: CustomBookImage(
              image: book.volumeInfo?.imageLinks?.thumbnail ?? ""),
        ),
        SizedBox(
          height: 38.h,
        ),
        Text(
          book.volumeInfo?.title ?? "no Title",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          book.volumeInfo?.authors?[0] ?? "Unknown",
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.7),
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        BookRating(
          rating: '4.5',
          count: book.volumeInfo?.pageCount ?? 0,
        ),
        SizedBox(
          height: 37.h,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
