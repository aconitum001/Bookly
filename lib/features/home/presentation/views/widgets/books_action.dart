import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/utils/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              text: "Free",
              txtColor: Colors.black,
              tL: 16.r,
              bL: 16.r,
              bgColor: Colors.white,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, book.volumeInfo?.previewLink ?? "");
              },
              text: getText(book),
              txtColor: Colors.white,
              tR: 16.r,
              bR: 16.r,
              bgColor: const Color(0xffEF8262),
              fontsize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo?.previewLink == null) {
      return 'Not avaliable';
    } else {
      return "preview";
    }
  }
}
