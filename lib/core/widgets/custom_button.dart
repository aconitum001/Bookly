import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.bL = 0,
      this.bR = 0,
      this.tL = 0,
      this.tR = 0,
      required this.bgColor,
      required this.text,
      required this.txtColor,
      this.fontsize,
      this.onPressed});

  final double tR, tL, bR, bL;
  final double? fontsize;
  final Color bgColor, txtColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(tL),
              topRight: Radius.circular(tR),
              bottomLeft: Radius.circular(bL),
              bottomRight: Radius.circular(bR),
            ),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: txtColor,
            fontWeight: FontWeight.w700,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
