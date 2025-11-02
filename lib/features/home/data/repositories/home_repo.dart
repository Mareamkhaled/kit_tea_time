import '../../../../core/models/cat_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/api_service.dart';

class HomeRepo {
   ApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<List<CatModel>>> getCatImages() async {
    try {
      var catImages = await apiService.fetchCats(1);
      return ApiResult.success(catImages);
    } on Exception catch (e) {
      return ApiResult.error(e);
    }
  }
}