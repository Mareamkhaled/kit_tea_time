import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/cat_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1/")
abstract class ApiService {
  // dio
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("images/search")
  Future<List<CatModel>> fetchCats(
    @Query("page") int page, {
    @Query("limit") int limit = 10,
    @Query("has_breeds") bool hasBreeds = true,
  });
}
