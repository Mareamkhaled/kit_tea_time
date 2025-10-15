import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/helpers/cache_helper.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_images.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    _navigateAfterDelay();
    super.initState();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    await _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final isOnboardingDone =
        CacheHelper.sharedPreferences.getBool("onBoarding") ?? false;

    if (!mounted) return;
    if (isOnboardingDone) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home,(route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, Routes.onBoarding,(route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Animate(
          effects: [
            BlurEffect(
              begin: const Offset(10, 10),
              end: const Offset(0, 0),
              duration: 2.seconds,
            ),
          ],
          child: Image.asset(AppImages.splashImage, width: 270),
        ),
      ),
    );
  }
}
