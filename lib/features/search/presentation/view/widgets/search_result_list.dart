import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/newest_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: books.length, // Example item count
        itemBuilder: (context, index) => NewestBookCard(book: books[index]),
        separatorBuilder: (context, index) => Gap(10.h),
      ),
    );
  }
}
