import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
    super.initState();
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
              duration: 3.seconds,
            ),
          ],
          child: Image.asset(AppImages.splashImage, width: 270),
        ),
      ),
    );
  }
}
