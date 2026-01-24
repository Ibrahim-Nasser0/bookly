import 'package:bookly/core/shared/widgets/custom_error_widget.dart';
import 'package:bookly/core/shared/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/view/widgets/beast_seller_card.dart';
import 'package:bookly/features/home/presentation/viewModel/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksSliver extends StatelessWidget {
  const NewestBooksSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errMessage),
          );
        }
        if (state is NewestBooksLoading) {
          return SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
        if (state is NewestBooksSuccess) {
          return SliverAnimatedList(
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BestSellerCard(book: state.books[index]),
                      ),
                    ),
                  );
                },
            initialItemCount: state.books.length,
          );
        }
        return SliverToBoxAdapter();
      },
    );
  }
}
