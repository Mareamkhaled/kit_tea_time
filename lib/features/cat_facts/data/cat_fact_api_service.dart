// import 'package:retrofit/retrofit.dart';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'cat_fact_api_service.g.dart';

// @RestApi(baseUrl: "https://meowfacts.herokuapp.com/")
class CatFactApiService {
  // factory CatFactApiService(Dio dio, {String baseUrl}) = _CatFactApiService;
  Dio dio;
  CatFactApiService(this.dio);
  // @GET("")
  Future<CatFactResponse> fetchCatFact() async {
    try {
      var data = await dio.get("https://meowfacts.herokuapp.com/?count=5");
      debugPrint('Full response: ${data.data}'); // Raw body
      debugPrint('Response headers: ${data.headers}');
      log("API response: ${data.data}");
      return CatFactResponse.fromJson(data.data);
    } on Exception catch (e, s) {
      log("API error: $e");
      log("Stack trace: $s");
      rethrow;
    }
  }
}

// @JsonSerializable()
class CatFactResponse {
  final List<String> data;

  CatFactResponse({required this.data});

  factory CatFactResponse.fromJson(Map<String, dynamic> json) =>
      CatFactResponse(data: json['data'] ?? []);
}
