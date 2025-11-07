import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../cubit/home_cubit.dart';

class FeaturedCatsSection extends StatelessWidget {
  const FeaturedCatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFailed) {
          return Center(child: Text(state.errorMessage));
        } else if (state is HomeLoaded) {
          final images = state.featuredCatsSection;
          if (images.isEmpty) {
            return const Center(child: Text('No images found'));
          }

          return
           StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.myWhite,
                    boxShadow: [customBoxShadow()],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          images[0].url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                images[0].breeds?[0].name??"Unknown",
                                style: AppStyle.lemon500Style18White.copyWith(
                                  color: AppColors.myBlack,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                images[0].breeds?[0].origin??"",
                                style: AppStyle.lemon500Style18White.copyWith(
                                  color: AppColors.myBlack,
                                  fontSize: 12,
                                ),
                              ),
                              const Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.info_outline,
                                      size: 18,
                                    ),
                                    label: const Text('Learn More'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.darkBlue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      textStyle: const TextStyle(fontSize: 14),
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {},
                                    icon:const CircleAvatar(
                                      backgroundColor: AppColors.myWhite,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: AppColors.darkBlue,
                                      ),
                                    ),
                                    tooltip: 'Favorite',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              for (int i = 1; i < images.length && i <= 4; i++)
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      boxShadow: [customBoxShadow()],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[i].url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 250,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.error),
                          ),
                        ),

                        const Positioned(
                          top: 12,
                          right: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),

                        // Info icon
                      ],
                    ),
                  ),
                ),
            ],
          );
        } else {
          return StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: List.generate(5, (index) {
              return StaggeredGridTile.count(
                crossAxisCellCount: index == 0 ? 2 : 1,
                mainAxisCellCount: 1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            }),
          );
        }
      },
    );
  }
}
