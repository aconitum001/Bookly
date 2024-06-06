import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding, vertical: 20.h),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                SizedBox(
                  height: 12.h,
                ),
                BookDetailsSection(
                  book: book,
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            child: const SimilarBooksSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        )
      ],
    );
  }
}
