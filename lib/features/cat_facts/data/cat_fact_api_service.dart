// import 'package:retrofit/retrofit.dart';
import 'dart:developer';

import 'package:dio/dio.dart';
class CatFactApiService {
  Dio dio;
  CatFactApiService(this.dio);
  // @GET("")
 Future<CatFactResponse> fetchCatFact() async {
    try {
      var catFacts = await dio.get("https://meowfacts.herokuapp.com/?count=5");
      return CatFactResponse.fromJson(catFacts.data);
    } on DioException catch (e, s) {
      log("Dio error: ${e.message}");
      log("Dio type: ${e.type}");
      log("Stack trace: $s");
      rethrow;
    }
  }
}

class CatFactResponse {
  final List<String> data;

  CatFactResponse({required this.data});

 factory CatFactResponse.fromJson(Map<String, dynamic> json) {
  final rawData = json['data'];
  if (rawData is List) {
    return CatFactResponse(data: rawData.map((e) => e.toString()).toList());
  } else {
    return CatFactResponse(data: []);
  }
}
}
