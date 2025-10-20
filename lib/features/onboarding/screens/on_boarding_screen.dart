import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/cache_helper.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/custom_box_shadow.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.onBoardingImage),
            const Gap(20),
            Text(
              AppConstants.onBoardingTitle,
              textAlign: TextAlign.center,

              style: AppStyle.lemon500Style20,
            ),
            const Gap(10),
            Text(
              AppConstants.onBoardingDesc,
              textAlign: TextAlign.center,
              style: AppStyle.lemon500Style20.copyWith(
                color: AppColors.myGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: () async {
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.root,
                    (route) => false,
                  );
                }
                await CacheHelper.sharedPreferences.setBool("onBoarding", true);
              },
              child: Container(
                width: 297,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [customBoxShadow()],
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.pets, color: AppColors.myWhite),
                    Text("Get Started", style: AppStyle.lemon500Style18White),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
