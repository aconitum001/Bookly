import 'package:bloc/bloc.dart';
import 'package:bookly/core/utils/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/search_repo/search_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepoImpl) : super(SearchBooksInitial());
  final SearchRepoImpl searchRepoImpl;

  Future<void> searchBooks({required String bookName}) async {
    var result = await searchRepoImpl.fetchSearchedBooks(bookName: bookName);

    result.fold(
      (failure) => emit(
        SearchBooksFailure(errMessage: failure.errMessage),
      ),
      (books) => emit(
        SearchBooksSuccess(books: books),
      ),
    );
  }
}
