import 'package:dio/dio.dart';
import 'package:diva/core/networking/api_constants.dart';
import 'package:diva/features/home/data/models/products_reponse_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.products)
  Future<List<ProductsReponseModel>> getHomeProducts();
}
