import 'package:bookly/core/constant/app_assets.dart';
import 'package:bookly/core/constant/app_duration.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(AppDuration.splashScreen, () {
      Get.to(
        () => const HomeView(),
        transition: Transition.leftToRight,
        duration: AppDuration.screenTransition,
      );
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero).animate(
          animationController.drive(
            CurveTween(curve: Curves.easeInOutCubicEmphasized),
          ),
        );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 3),
        AnimatedLogo(slidingAnimation: slidingAnimation),
        const Spacer(flex: 2),
        AnimatedText(slidingAnimation: slidingAnimation),
        const Spacer(flex: 1),
      ],
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: slidingAnimation,
        child: Text(
          'Read Free Books',
          textAlign: TextAlign.center,
          style: Styles.titleMedium,
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: slidingAnimation,
        child: Image.asset(AppAssets.logo),
      ),
    );
  }
}
