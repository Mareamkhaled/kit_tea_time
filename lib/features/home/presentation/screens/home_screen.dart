import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_style.dart';
import '../widgets/breeds_section.dart';
import '../widgets/custom_shader_mask.dart';
import '../widgets/featured_cat_section.dart';
import '../widgets/info_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(MediaQuery.of(context).padding.top + 20),
                Image.asset(AppImages.splashImage, width: 100),
                const Gap(10),
                const CustomShaderMask(text: AppConstants.homeTitle),
                const Gap(10),
                Text(
                  textAlign: TextAlign.center,
                  AppConstants.homeDesc,
                  style: AppStyle.lemon300Style12Grey,
                ),
                const Gap(20),
                infoSection(),

                const Gap(20),
                Row(
                  children: [
                    CustomShaderMask(
                      text: "Featured Cats",
                      style: AppStyle.lemon500Style18White,
                    ),
                  ],
                ),
                const Gap(20),

                const FeaturedCatsSection(),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShaderMask(
                      text: "Popular Breeds",
                      style: AppStyle.lemon500Style18White,
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: AppStyle.lemon300Style12Grey,
                      ),
                    ),
                  ],
                ),

                const Gap(10),
                const BreedsSection(),
              ],
            ),
          ),
        ),
      
    );
  }
}