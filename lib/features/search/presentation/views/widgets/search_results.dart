import 'package:bookly/core/widgets/custom_loading_shimmer.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/features/search/presentation/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          if (state.books.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  "Invalid Search \n ლ(ಠ益ಠლ)",
                  style: TextStyle(
                    fontSize: 30.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              ),
              childCount: 10,
            ),
          );
        } else if (state is SearchBooksFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
          );
        } else {
          return CustomLoadingShimmer(
            hoirzantalPadding: 0,
            verticalPadding: 10.h,
          );
        }
      },
    );
  }
}
