import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
    required this.hoirzantalPadding,
    required this.verticalPadding,
  });

  final double hoirzantalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: hoirzantalPadding,
              vertical: verticalPadding,
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade100,
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1.7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomShimmerContainer(),
                          CustomShimmerContainer(),
                          CustomShimmerContainer(),
                          CustomShimmerContainer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomShimmerContainer extends StatelessWidget {
  const CustomShimmerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
    );
  }
}
