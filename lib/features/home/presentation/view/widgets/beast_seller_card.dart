import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 107.h,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BookCard(small: true),
          Gap(5.w),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleAndAutherName(),
                const Spacer(),
                const PriceAndRatingRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAndAutherName extends StatelessWidget {
  const TitleAndAutherName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Harry Potter\nand the Goblet of Fire', // Book Title
          style: Styles.titleMedium,
          maxLines: 2,
        ),
        SizedBox(width: 5.w),
        Text(
          'J.K. Rowling', // Author Name
          style: Styles.subTitle,
        ),
      ],
    );
  }
}

class PriceAndRatingRow extends StatelessWidget {
  const PriceAndRatingRow({super.key});

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
                text: '4.5', // Rating
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              TextSpan(
                text: ' (200)', // Number of Ratings
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
