import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SettingsCard extends StatelessWidget {
  final Widget child;
  const SettingsCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.myWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(padding: const EdgeInsets.all(18.0), child: child),
    );
  }
}
