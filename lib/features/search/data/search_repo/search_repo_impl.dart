import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/search_repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      var data = await apiService.get(endPoint: "volumes?q=intitle:$bookName");

      final List<BookModel> books = [];

      if (data["totalItems"] == 0) {
        return right(books);
      }
      for (var item in data["items"]) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
