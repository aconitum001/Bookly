import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        ShimmerLoadingWidget(),
        ShimmerLoadingWidget(),
        ShimmerLoadingWidget(),
        ShimmerLoadingWidget(),
      ],
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: AspectRatio(
          aspectRatio: 1 / 1.7,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
