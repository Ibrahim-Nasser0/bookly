import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/book_details_view_body.dart';
import 'package:bookly/features/home/presentation/viewModel/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();

    final category = widget.book.volumeInfo?.categories?.isNotEmpty == true
        ? widget.book.volumeInfo!.categories!.first
        : 'Flutter';

    context.read<SimilarBooksCubit>().fetchSimilarBooks(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(book: widget.book)),
    );
  }
}
