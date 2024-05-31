import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              text: "19.99€",
              txtColor: Colors.black,
              tL: 16,
              bL: 16,
              bgColor: Colors.white,
            ),
          ),
          Expanded(
            child: CustomButton(
              text: "Free preview",
              txtColor: Colors.white,
              tR: 16,
              bR: 16,
              bgColor: Color(0xffEF8262),
              fontsize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
