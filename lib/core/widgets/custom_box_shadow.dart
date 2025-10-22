import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';

BoxShadow customBoxShadow() {
  return BoxShadow(
    color: AppColors.myBlack.withValues(alpha: 0.1),
    blurRadius: 6,
    offset: const Offset(0, 2),
  );
}
