import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'settings_text_style.dart';

class SettingsFooter extends StatelessWidget {
  const SettingsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Made with', style: SettingsTextStyle.subtitleStyle),
            const Gap(4),
            const Icon(Icons.favorite, color: Colors.red, size: 18),
            const Gap(4),

            Text('for cat lovers', style: SettingsTextStyle.subtitleStyle),
          ],
        ),
        const Gap(4),

        Text('Powered by The Cat API', style: SettingsTextStyle.subtitleStyle),
      ],
    );
  }
}
