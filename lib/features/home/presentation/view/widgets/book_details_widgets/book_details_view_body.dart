import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/books_action_button.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/rateing_row.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/similar_books_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const CustomBookDetailsAppBar(),
          Gap(20.h),
          Hero(
            transitionOnUserGestures: true,
            tag: book.id ?? book.volumeInfo?.title ?? UniqueKey(),
            child: CachedNetworkImage(
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
              height: 220.h,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Gap(20.h),
          Text(book.volumeInfo?.title ?? 'No Title', style: Styles.titleMedium),

          Text(
            (book.volumeInfo?.authors?.isNotEmpty ?? false)
                ? book.volumeInfo!.authors![0]
                : 'Unknown Author',
            style: Styles.subTitle,
          ),
          Gap(10.h),
          RateingRow(
            rating: book.volumeInfo?.averageRating ?? 0,
            ratingCount: book.volumeInfo?.ratingCount ?? 0,
          ),
          Gap(30.h),
          BooksActionButton(book: book),
          Gap(30.h),
          const SimilarBooksList(),
        ],
      ),
    );
  }
}

