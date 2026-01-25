import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String q}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(q: q);

    result.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
        log('Failed to fetch Search books: ${failure.errMessage}');
      },
      (books) {
        emit(SearchSuccess(books: books));
        log('Successfully fetched ${books.length} Search books');
      },
    );
  }
}
