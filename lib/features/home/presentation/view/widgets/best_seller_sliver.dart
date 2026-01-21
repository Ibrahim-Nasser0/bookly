import 'package:bookly/features/home/presentation/view/widgets/beast_seller_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerSliver extends StatelessWidget {
  const BestSellerSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (_, index) => BestSellerCard(),
      separatorBuilder: (_, index) => const Gap(10),
      itemCount: 200,
    );
  }
}
