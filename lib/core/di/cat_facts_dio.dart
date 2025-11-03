import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/cat_facts/data/cat_fact_api_service.dart';
import '../../features/cat_facts/data/cat_fact_repo.dart';
import '../../features/cat_facts/presentation/cubit/cat_fact_cubit.dart';

final catFactsGetIt = GetIt.instance;

void setUpCatFactsDio() {
  catFactsGetIt.registerLazySingleton<CatFactCubit>(
    () => CatFactCubit(catFactRepo: catFactsGetIt()),
  );
  catFactsGetIt.registerLazySingleton<CatFactRepo>(
    () => CatFactRepo(catFactApiService: catFactsGetIt()),
  );
  catFactsGetIt.registerLazySingleton<CatFactApiService>(
    () => CatFactApiService(createCatFactDio()),
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
