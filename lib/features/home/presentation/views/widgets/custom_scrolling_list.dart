import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CustomScrollingList extends StatelessWidget {
  const CustomScrollingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return const LoadingNewestBooksShimmer();
        }
      },
    );
  }
}

class LoadingNewestBooksShimmer extends StatelessWidget {
  const LoadingNewestBooksShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 8,
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
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
      margin: EdgeInsets.all(5),
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
    );
  }
}
