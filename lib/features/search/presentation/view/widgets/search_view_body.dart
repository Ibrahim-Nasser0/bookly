import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/shared/widgets/custom_error_widget.dart';
import 'package:bookly/core/shared/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list.dart';
import 'package:bookly/features/search/presentation/viewModel/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: BlocProvider(
          create: (context) => SearchCubit(getIt<SearchRepoImpl>()),
          child: Builder(
            builder: (context) => Column(
              crossAxisAlignment: .start,
              children: [
                const CustomBookDetailsAppBar(),
                Gap(10.h),
                CustomSearchField(
                  onSubmitted: (query) {
                    context.read<SearchCubit>().fetchSearchBooks(q: query);
                  },
                ),
                Gap(20.h),
                Text('Search Results', style: Styles.titleMedium),
                Gap(10.h),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchSuccess) {
                      return SearchResultList(books: state.books);
                    } else if (state is SearchLoading) {
                      return CustomLoadingIndicator();
                    } else if (state is SearchFailure) {
                      return CustomErrorWidget(errorMessage: state.errMessage);
                    }
                    return Gap(2);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

