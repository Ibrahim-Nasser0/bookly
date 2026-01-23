import 'package:bookly/core/constant/app_colors.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/viewModel/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/viewModel/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewestBooksCubit>(
          create: (_) =>
              NewestBooksCubit(getIt<HomeRepoImpl>())..fetchNewestBooks(),
        ),
        BlocProvider<FeaturedBooksCubit>(
          create: (_) =>
              FeaturedBooksCubit(getIt<HomeRepoImpl>())..fetchFeaturedBooks(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(308, 642),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColors.backgroundColor,
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
