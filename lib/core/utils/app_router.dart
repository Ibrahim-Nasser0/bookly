import 'package:bookly/features/auth/presentation/view/splash_view.dart';
import 'package:bookly/features/home/presentation/view/book_details_view.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String homeView = '/homeView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
