


import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          BookCard(),
      options: CarouselOptions(
        height: AppSizes.cardHeight.h,
        aspectRatio: AppSizes.cardWidth / AppSizes.cardHeight,
        viewportFraction: 0.5,
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
}
