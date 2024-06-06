import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                  textEditingController: textEditingController,
                  onPressed: () {
                    BlocProvider.of<SearchBooksCubit>(context)
                        .searchBooks(bookName: textEditingController.text);
                    textEditingController.clear();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Search Result",
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          const SearchResults(),
        ],
      ),
    );
  }
}
