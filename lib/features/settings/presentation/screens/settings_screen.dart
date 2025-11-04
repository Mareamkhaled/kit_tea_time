import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_footer.dart';
import '../widgets/settings_text_style.dart';
import '../widgets/support_tile.dart';
import '../widgets/switch_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SettingsBody());
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Gap(40),
        Text(
          "Settings",
          style: AppStyle.lemon500Style18White.copyWith(
            color: AppColors.myBlack,
          ),
        ),
        Text("Customize your experience", style: AppStyle.lemon300Style12Grey),
        const SizedBox(height: 12),

        SettingsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Appearance'),
              SwitchTile(
                icon: Icons.brightness_6_outlined,
                label: 'Dark Mode',
                subtitle: 'Light theme active',
                value: false,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
        const Gap(20),

        SettingsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Notifications'),
              SwitchTile(
                icon: Icons.notifications_none,
                label: 'New Breeds',
                subtitle: 'Get notified about new breeds',
                value: false,
                onChanged: (_) {},
              ),
              const Divider(),
              SwitchTile(
                icon: Icons.favorite_border,
                label: 'Favorites Updates',
                subtitle: 'Updates about favorited breeds',
                value: false,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
        const Gap(20),

        SettingsCard(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(
                  'Version',
                  style: AppStyle.lemon300Style12Grey.copyWith(
                    color: AppColors.myBlack,
                    fontSize: 13,
                  ),
                ),
                subtitle: Text('1.0.0', style: SettingsTextStyle.subtitleStyle),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.storage_outlined),
                title: Text('Data Source', style: SettingsTextStyle.labelStyle),
                subtitle: Text(
                  'The Cat API',
                  style: SettingsTextStyle.subtitleStyle,
                ),
                trailing: Chip(
                  color: WidgetStateProperty.all(AppColors.myLightGrey),
                  label: const Text('Active'),
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        SettingsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  SectionHeader(title: 'Support'),
              SupportTile(
                icon: Icons.email_outlined,
                label: 'Contact Support',
                onTap: () {},
              ),
              const Divider(),
              SupportTile(
                icon: Icons.info_outline,
                label: 'Privacy Policy',
                onTap: () {},
              ),
            ],
          ),
        ),
        const Gap(35),

        const SettingsFooter(),
      ],
    );
  }
}

//! Reusable Section Header
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: SettingsTextStyle.labelStyle
      ),
    );
  }
}
