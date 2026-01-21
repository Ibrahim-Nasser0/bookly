import 'package:bookly/core/constant/app_assets.dart';
import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const CustomBookDetailsAppBar(),
          Gap(20.h),
          Image.asset(AppAssets.coverBook, height: 220.h),
          Gap(20.h),
          Text('The Jungle Book', style: Styles.titleMedium),
          Text(' Rudyard Kipling', style: Styles.subTitle),
          Gap(10.h),
          const RateingRow(),
          Gap(30.h),
          const BooksAction(),
          Gap(30.h),
          const AlsoLikeBooks(),
        ],
      ),
    );
  }
}

class AlsoLikeBooks extends StatelessWidget {
  const AlsoLikeBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.subTitle.copyWith(color: Colors.white),
        ),
        Gap(5.h),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 90.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Image.asset(AppAssets.coverBook),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        const CustomButton(text: "19.99€"),
        const CustomButton(left: false, text: 'Free preview'),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.left = true, required this.text});
  final bool left;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size(130.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: left
              ? BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadius.r),
                  bottomLeft: Radius.circular(AppSizes.borderRadius.r),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(AppSizes.borderRadius.r),
                  bottomRight: Radius.circular(AppSizes.borderRadius.r),
                ),
        ),
        backgroundColor: left ? Colors.white : Color(0xffEF8262),
        foregroundColor: left ? Color(0xffEF8262) : Colors.white,
        textStyle: Styles.titleMedium,
      ),
      child: Text(
        text,
        style: Styles.titleMedium.copyWith(
          color: left ? Colors.black : Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class RateingRow extends StatelessWidget {
  const RateingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, size: AppSizes.largIconSize.sp),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: AppSizes.mediumIconSize.sp,
          ),
        ),
      ],
    );
  }
}
