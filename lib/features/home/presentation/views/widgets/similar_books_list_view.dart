import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/view_models/fetch_similar_books/fetch_similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: CustomBookImage(
                    image:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            ""),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
            ),
          );
        } else if (state is FetchSimilarBooksFailure) {
          return Text(state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: const CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
