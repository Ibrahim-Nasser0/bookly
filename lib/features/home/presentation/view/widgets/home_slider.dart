import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/shared/widgets/custom_error_widget.dart';
import 'package:bookly/core/shared/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:bookly/features/home/presentation/viewModel/featured_books_cubit/featured_books_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return CustomLoadingIndicator();
        }
        if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        }
        if (state is FeaturedBooksSuccess) {
          if (state.books.isEmpty) {
            return const CustomErrorWidget(errorMessage: 'No Books Found');
          }
          return CarouselSlider.builder(
            itemCount: state.books.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    GestureDetector(
                      onTap: () => GoRouter.of(context).push(
                        AppRouter.bookDetailsView,
                        extra: state.books[itemIndex],
                      ),
                      child: BookCard(book: state.books[itemIndex]),
                    ),
            options: CarouselOptions(
              height: AppSizes.cardHeight.h,
              aspectRatio: AppSizes.cardWidth.w / AppSizes.cardHeight.h,
              viewportFraction: 0.57,
              initialPage: 0,
              enableInfiniteScroll: false,

              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,

              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
