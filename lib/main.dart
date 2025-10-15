import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/helpers/cache_helper.dart';
import 'core/routing/routes.dart';
import 'core/routing/routing.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Kit Tea Time',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.myWhite),
      initialRoute: Routes.splash,
      onGenerateRoute: Routing().onGenerateRoute,
    );
  }
}
