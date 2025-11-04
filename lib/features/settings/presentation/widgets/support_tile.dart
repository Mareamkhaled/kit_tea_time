import 'package:flutter/material.dart';

import 'settings_text_style.dart';

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SupportTile({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(icon, size: 22),
            const SizedBox(width: 12),
            Text(label, style: SettingsTextStyle.labelStyle),
          ],
        ),
      ),
    );
  }
}
