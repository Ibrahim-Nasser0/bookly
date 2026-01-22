import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/beast_seller_card.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const CustomBookDetailsAppBar(),
            Gap(10.h),
            const CustomSearchField(),
            Gap(20.h),
            Text('Search Results', style: Styles.titleMedium),
            Gap(10.h),
            const SearchResultList(),
          ],
        ),
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10, // Example item count
        itemBuilder: (context, index) => BestSellerCard(),
        separatorBuilder: (context, index) => Gap(10.h),
      ),
    );
  }
}
