import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Scale factor based on screen width (min 0.8x, max 1.3x)
        double scale = (constraints.maxWidth / 400).clamp(0.8, 1.3);
        double verticalPadding = 20 * scale;
        double horizontalPadding = 20 * scale;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12 * scale),
            boxShadow: [customBoxShadow()],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF44BDB6),
                Color.fromARGB(255, 189, 247, 244),
                Color.fromARGB(255, 135, 239, 234),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.starImage, width: 50 * scale),
              Gap(10 * scale),
              Text(
                "Ready to find your perfect match?",
                textAlign: TextAlign.center,
                style: AppStyle.lemon300Style12Grey.copyWith(
                  color: AppColors.myBlack,
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(8 * scale),
              Text(
                "Search through hundreds of cat breeds and find the one that fits your lifestyle",
                textAlign: TextAlign.center,
                style: AppStyle.lemon300Style12Grey.copyWith(
                  color: AppColors.myBlack,
                  fontSize: 12 * scale,
                ),
              ),
              Gap(20 * scale),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15 * scale,
                  horizontal: 24 * scale,
                ),
                decoration: BoxDecoration(
                  boxShadow: [customBoxShadow()],
                  borderRadius: BorderRadius.circular(20 * scale),
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  "Start Searching",
                  style: AppStyle.lemon300Style12Grey.copyWith(
                    color: Colors.white,
                    fontSize: 13 * scale,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
