import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/helpers/cache_helper.dart';
import 'core/helpers/di.dart';
import 'core/routing/routes.dart';
import 'core/routing/routing.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setUp();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );

  //  ApiService apiService = ApiService(createAndSetUpDio());
  // ApiService apiService = getIt<ApiService>();
  // var cats = await apiService.fetchCats(1, limit: 5);
  // var breeds = cats[0].breeds;

  //   for (var cat in cats) {
  //     debugPrint('Cat ID: ${cat.id}, Breeds: ${cat.breeds}');
  //   }
  // var breeds = cats.expand((cat) => cat.breeds ?? []).toList();
  // debugPrint('Total breeds found: ${breeds.length}');
  // debugPrint('Breeds: ${breeds[0].name}');
  // final response = await Dio().get('https://api.thecatapi.com/v1/images/search?has_breeds=true&limit=1');
  // print(response.data);
  //  final cat = CatModel.fromJson(response.data[0]);
  // print(cat.breeds); // Should now show a non-null list
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
