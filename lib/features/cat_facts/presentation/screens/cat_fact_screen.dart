
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../cubit/cat_fact_cubit.dart';

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
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CatFactLoaded) {
                    final facts = state.catFact.data;
                    return ListView.builder(
                      itemCount: facts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [customBoxShadow()],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE5F9F7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Color(0xFF00BFA5),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  facts[index],
                                  style: AppStyle.lemon300Style12Grey.copyWith(
                                    color: AppColors.myBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
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
