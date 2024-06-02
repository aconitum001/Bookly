import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .16,
      child: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CustomBookImage(
              image:
                  "https://books.google.com/books/content?id=9GwrmHRl490C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
