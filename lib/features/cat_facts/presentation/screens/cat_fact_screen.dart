import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_style.dart';
import '../cubit/cat_fact_cubit.dart';
import '../widgets/cat_fact_card.dart';

class CatFactScreen extends StatelessWidget {
  const CatFactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              Image.asset(AppImages.factImage, width: 80),
              const Gap(20),
              Text(
                "Cat Fact",
                style: AppStyle.lemon500Style18White.copyWith(
                  color: AppColors.myBlack,
                ),
              ),
              const Gap(10),
              Text(
                "Discover fascinating facts about our feline friends",
                style: AppStyle.lemon300Style12Grey,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              InkWell(
                onTap: () {
                  context.read<CatFactCubit>().fetchCatFact();
                },
                child: Container(
                  width: 280,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.white,
                      ),
                      const Gap(20),
                      Text(
                        "Get New Facts",
                        style: AppStyle.lemon500Style18White,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              BlocBuilder<CatFactCubit, CatFactState>(
                builder: (context, state) {
                  if (state is CatFactLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const CatFactCard(text: "Loading...");
                        },
                      ),
                    );
                  } else if (state is CatFactLoaded) {
                    final facts = state.catFact.data;
                    return ListView.builder(
                      itemCount: facts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CatFactCard(text: facts[index]);
                      },
                    );
                  } else if (state is CatFactError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
