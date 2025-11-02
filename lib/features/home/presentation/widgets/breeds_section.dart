import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/models/cat_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../cubit/home_cubit.dart';
import 'custom_small_container.dart';

class BreedsSection extends StatelessWidget {
  const BreedsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFailed) {
          return Center(child: Text(state.errorMessage));
        } else if (state is HomeLoaded) {
          final images = state.breedsCatsSection;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length < 5 ? images.length : 5,
            itemBuilder: (context, index) {
              List<BreedModel>? breeds = images[index].breeds;

              if (breeds == null || breeds.isEmpty) {
                return const SizedBox.shrink();
              }

              final breed = breeds[0];
              final twoWords = getTwoWords(breed.temperament);

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  boxShadow: [customBoxShadow()],
                  color: AppColors.myWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          images[index].url,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              breed.name ?? "Unknown",
                              style: AppStyle.lemon500Style18White.copyWith(
                                fontSize: 16,
                                color: AppColors.myBlack,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              breed.origin ?? "Unknown",
                              style: AppStyle.lemon300Style12Grey,
                            ),
                            const Gap(5),
                            Row(
                              children: [
                                CustomSmallContainer(
                                  text: twoWords[0],
                                  color: AppColors.myBlack.withAlpha(25),
                                ),
                                const Gap(10),
                                CustomSmallContainer(
                                  text: twoWords[1].isNotEmpty ? twoWords[1] : "Energetic",
                                  color: const Color(0x1A000000),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          // Loading shimmer placeholder
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.myWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [customBoxShadow()],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.myGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 18,
                              width: double.infinity,
                              color: AppColors.myGrey,
                            ),
                            const Gap(6),
                            Container(
                              height: 14,
                              width: 80,
                              color: AppColors.myGrey,
                            ),
                            const Gap(6),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.myGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.myGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

List<String> getTwoWords(String? text) {
  if (text == null || text.isEmpty) return ["", ""];
  final parts = text.split(RegExp(r'[,\s]+')).where((e) => e.isNotEmpty).toList();
  final firstWord = parts.isNotEmpty ? parts[0] : "";
  final secondWord = parts.length > 1 ? parts[1] : "";
  return [firstWord, secondWord];
}
