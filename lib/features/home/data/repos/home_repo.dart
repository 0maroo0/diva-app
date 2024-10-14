import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/home/data/apis/home_api_service.dart';
import 'package:diva/features/home/data/models/products_reponse_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;

  HomeRepo(this.homeApiService);

  Future<ApiResult<List<ProductsReponseModel>>> getHomeProducts() async {
    try {
      final response = await homeApiService.getHomeProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
