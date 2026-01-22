import 'package:bookly/core/constant/app_colors.dart';
import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/shared/widgets/custom_app_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_sliver.dart';
import 'package:bookly/features/home/presentation/view/widgets/home_slider.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          toolbarHeight: 80,
          title: CustomAppBar(),
        ),

        const SliverToBoxAdapter(child: HomeSlider()),
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          toolbarHeight: 60,
          title: Text('Best Seller', style: Styles.titleMedium),
        ),

        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          sliver: BestSellerSliver(),
        ),
      ],
    );
  }
}
