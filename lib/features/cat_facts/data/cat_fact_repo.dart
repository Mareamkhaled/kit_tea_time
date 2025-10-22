import '../../../core/networking/api_result.dart';
import 'cat_fact_api_service.dart';

class CatFactRepo {
  final CatFactApiService catFactApiService;
  CatFactRepo({required this.catFactApiService});
  Future<ApiResult<CatFactResponse>> fetchCatFact() async {
    try {
      var facts = await catFactApiService.fetchCatFact();
      return ApiResult.success(facts);
    } on Exception catch (e) {
      return ApiResult.error(e);
    }
  }
}
