import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: AspectRatio(
        aspectRatio: 1 / 1.8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage("assets/images/test_image.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
