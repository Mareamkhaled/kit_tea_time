import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'info_item.dart';

Widget infoSection() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      InfoItem(text: "Breeds", count: "60+", icon: Icons.pets),
      InfoItem(
        text: "Photos",
        count: "1000+",
        icon: Icons.photo_library,
        color: AppColors.primaryColor,
      ),
      InfoItem(text: "Favorites", count: "0", icon: Icons.favorite),
    ],
  );
}
