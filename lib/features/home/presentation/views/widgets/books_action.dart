import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: CustomButton(
              text: "Free",
              txtColor: Colors.black,
              tL: 16,
              bL: 16,
              bgColor: Colors.white,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, book.volumeInfo.previewLink!);
              },
              text: getText(book),
              txtColor: Colors.white,
              tR: 16,
              bR: 16,
              bgColor: const Color(0xffEF8262),
              fontsize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not avaliable';
    } else {
      return "preview";
    }
  }
}
