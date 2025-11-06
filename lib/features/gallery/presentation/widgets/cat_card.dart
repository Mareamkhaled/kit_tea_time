import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_box_shadow.dart';

class CatCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onFavoritePressed;

  const CatCard({
    super.key,
    required this.imageUrl,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.myWhite,
            boxShadow: [customBoxShadow()],
            borderRadius: BorderRadius.circular(16), // rounded corners
            image: DecorationImage(
              //! this will change to network image later
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),

          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Material(
            color: AppColors.myWhite,
            shape: const CircleBorder(),
            child: SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                iconSize: 18,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.favorite_border),
                onPressed: onFavoritePressed,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
