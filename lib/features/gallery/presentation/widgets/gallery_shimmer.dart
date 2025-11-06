import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';

class GalleryShimmer extends StatelessWidget {
  const GalleryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.myGrey.withValues(alpha: 0.3),
                          ],
                        ),
                        child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1,
                              ),
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      );
  }
}