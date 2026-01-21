import 'package:bookly/features/home/presentation/view/widgets/beast_seller_card.dart';
import 'package:flutter/material.dart';

class BestSellerSliver extends StatelessWidget {
  const BestSellerSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BestSellerCard(),
                ),
              ),
            );
          },
      initialItemCount: 200,
    );
  }
}
