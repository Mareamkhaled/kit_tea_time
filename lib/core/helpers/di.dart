import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../features/cat_facts/data/cat_fact_api_service.dart';
import '../../features/cat_facts/data/cat_fact_repo.dart';
import '../../features/cat_facts/presentation/cubit/cat_fact_cubit.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<CatFactCubit>(
    () => CatFactCubit(catFactRepo: getIt()),
  );
  getIt.registerLazySingleton<CatFactRepo>(
    () => CatFactRepo(catFactApiService: getIt()),
  );
  getIt.registerLazySingleton<CatFactApiService>(
    () => CatFactApiService(createCatFactDio()),
  );

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(homeRepo: getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(createAndSetUpDio()),
  );
}

Dio createCatFactDio() {
  final dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 40);
  dio.options.receiveTimeout = const Duration(seconds: 40);
  dio.options.sendTimeout = const Duration(seconds: 40);
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      logPrint: (object) => debugPrint(object.toString()),
    ),
  );
  return dio;
}

  
Dio createAndSetUpDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..options.headers = {
      "x-api-key":
          "live_O3N32eEqGNFqPxDT9iWLLcXWMZCbK5Ik627UzQm4dI1RwIvad1pXOq3KIRU1XaYc",
    };

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  return dio;
}