import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key, this.book = const BookModel()});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.bookDetailsView),
      child: SizedBox(
        width: double.infinity,
        height: 107.h,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BookCard(small: true, book: book),
            Gap(5.w),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndAutherName(
                      auther: book.volumeInfo!.authors![0],
                      title: book.volumeInfo!.title!,
                    ),
                    const Spacer(),
                    PriceAndRatingRow(
                      averageRating: book.volumeInfo!.averageRating!,
                      ratingCount: book.volumeInfo!.ratingCount!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleAndAutherName extends StatelessWidget {
  const TitleAndAutherName({
    super.key,
    required this.auther,
    required this.title,
  });
  final String auther;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, // Book Title
          style: Styles.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(width: 5.w),
        Text(
          auther,
          style: Styles.subTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

class PriceAndRatingRow extends StatelessWidget {
  const PriceAndRatingRow({
    super.key,
    required this.averageRating,
    required this.ratingCount,
  });
  final double averageRating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Text(
          '19.99', // Price
          style: Styles.titleMedium,
        ),
        Gap(2.w),
        Icon(Icons.euro_sharp, size: 16.sp),
        Gap(30.w),

        Icon(Icons.star, color: Colors.amber, size: AppSizes.smallIconSize.sp),
        Gap(2.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: averageRating == 0
                    ? 'null'
                    : averageRating.toString(), // Rating
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              TextSpan(
                text: ' ($ratingCount)', // Number of Ratings
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ],
          ),

          // style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ],
    );
  }
}
