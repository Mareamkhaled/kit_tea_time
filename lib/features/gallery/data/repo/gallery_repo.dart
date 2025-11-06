import '../../../../core/models/cat_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/api_service.dart';

class GalleryRepo {
  final ApiService apiService;

  GalleryRepo(this.apiService);

  Future<ApiResult<List<CatModel>>> getGalleryImages({
    required int page,
    int limit = 9,
  }) async {
    try {
      var catImages = await apiService.fetchCats(page, limit: limit);
      return ApiResult.success(catImages);
    } on Exception catch (e) {
      return ApiResult.error(e);
    }
  }
}
