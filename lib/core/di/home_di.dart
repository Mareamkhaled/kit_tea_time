import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../services/api_service.dart';
import 'di.dart' show createAndSetUpDio;

final homeGetIt = GetIt.instance;

void setUpHomeDio() {
  homeGetIt.registerLazySingleton<HomeCubit>(() => HomeCubit(homeRepo: homeGetIt()));
  homeGetIt.registerLazySingleton<HomeRepo>(() => HomeRepo(homeGetIt()));
  homeGetIt.registerLazySingleton<ApiService>(
    () => ApiService(createAndSetUpDio()),
  );
}