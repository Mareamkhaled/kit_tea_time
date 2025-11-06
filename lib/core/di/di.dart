import 'package:dio/dio.dart';
import 'cat_facts_dio.dart';
import 'gallery_di.dart';
import 'home_di.dart';


void setUp() {
 setUpHomeDio();
 setUpCatFactsDio();
 setUpGalleryDio();
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