


import 'package:bookly/core/shared/widgets/custom_error_widget.dart';
import 'package:bookly/core/shared/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:bookly/features/home/presentation/viewModel/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksList extends StatelessWidget {
  const SimilarBooksList({super.key});

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
                      if (state.books.isEmpty) {
                        return Text('Sorry');
                      } else {
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
                      }
                    } else if (state is SimilarBooksLoading) {
                      return const CustomLoadingIndicator();
                    } else if (state is SimilarBooksFailure) {
                      return CustomErrorWidget(errorMessage: state.errMessage);
                    }
                    return const SizedBox();
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
