import 'dart:developer';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String q,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?&orderBy=relevance&q=$q",
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log(e.toString());
        }
      }
      log('Fetched ${books.length} featured books');

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
