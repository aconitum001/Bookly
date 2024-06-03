import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          List<BookModel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .26,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomBookImage(
                  image: books[index].volumeInfo.imageLinks.thumbnail!,
                ),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .26,
            child: const CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
