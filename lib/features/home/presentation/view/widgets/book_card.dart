import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    this.small = false,
    this.book = const BookModel(),
  });
  final bool small;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(AppSizes.cardBorderRadius),
      child: Hero(
        transitionOnUserGestures: true,
        tag: book.id ?? book.volumeInfo?.title ?? UniqueKey(),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          width: small ? AppSizes.smallCardWidth.w : AppSizes.cardWidth.w,
          height: small ? AppSizes.smallCardHeight.h : AppSizes.cardHeight.h,
          imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
