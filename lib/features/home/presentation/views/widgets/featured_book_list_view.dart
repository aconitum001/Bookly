import 'package:bookly/features/home/presentation/views/widgets/Custom_play_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CustomBookImage(
            child: CustomPlayButton(),
          ),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
