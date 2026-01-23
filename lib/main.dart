import 'package:bookly/core/constant/app_colors.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(308, 642),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),

       // home: const SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
