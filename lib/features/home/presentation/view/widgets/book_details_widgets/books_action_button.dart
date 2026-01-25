import 'package:bookly/core/utils/functions/launce_uri.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.book});
  final BookModel book;

  String isAvailable(String text, String? link) {
    if ((link == null)) {
      return "Not Available";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        CustomBookButton(
          text: isAvailable(
            book.saleInfo?.listPrice?.amount.toString() ?? "Free",
            book.saleInfo?.buyLink,
          ),
          onPressed: () async {
            await lunchCustomUrl(context, book.saleInfo?.buyLink);
          },
        ),
        CustomBookButton(
          left: false,
          text: isAvailable('Free preview', book.volumeInfo!.previewLink!),
          onPressed: () async {
            await lunchCustomUrl(context, book.volumeInfo!.previewLink!);
          },
        ),
      ],
    );
  }
}
