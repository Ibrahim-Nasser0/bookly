import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/shared/widgets/custom_error_widget.dart';
import 'package:bookly/core/shared/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:bookly/features/home/presentation/viewModel/similar_books_cubit/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
                child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
                  builder: (context, state) {
                    if (state is SimilarBooksSuccess) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () => GoRouter.of(context).push(
                                AppRouter.bookDetailsView,
                                extra: state.books[index],
                              ),
                              child: BookCard(
                                small: true,
                                book: state.books[index],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is SimilarBooksLoading) {
                      return const CustomLoadingIndicator();
                    } else if (state is SimilarBooksFailure) {
                      return CustomErrorWidget(errorMessage: state.errMessage);
                    }
                    return SizedBox();
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
        const CustomButton(text: "Free"),
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
  const RateingRow({
    super.key,
    required this.rating,
    required this.ratingCount,
  });
  final double rating;
  final int ratingCount;

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
                text: rating.toString(), // Rating
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
