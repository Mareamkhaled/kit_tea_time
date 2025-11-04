import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'settings_text_style.dart';

class SwitchTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: SettingsTextStyle.labelStyle),
      subtitle: Text(subtitle, style: SettingsTextStyle.subtitleStyle),
      trailing: Switch(
        // splashRadius: 50,
        trackColor: WidgetStateProperty.all(AppColors.myLightGrey),
        thumbIcon: WidgetStateProperty.all(
          const Icon(Icons.circle, size: 30, color: AppColors.myWhite),
        ),
        // inactiveThumbColor: AppColors.myGrey,
        focusColor: AppColors.darkBlue,
        // trackOutlineColor: WidgetStateProperty.all(AppColors.myLightGrey),
        // thumbColor: WidgetStateProperty.all(AppColors.myOrange),
        // activeThumbColor: AppColors.myBlack,
        value: value,
        onChanged: onChanged,
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}