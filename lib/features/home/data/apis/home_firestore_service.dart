import 'package:diva/features/home/data/models/products_reponse_model.dart';

abstract class HomeFirestoreService {
  Future<List<ProductsReponseModel>> getHomeFavoriteProductsFromFirestore();

  Future<void> addProductToFavorite(ProductsReponseModel product);

  Future<void> removeProductFromFavorite(ProductsReponseModel product);

  Future<void> addToCart(ProductsReponseModel product);

  Future<void> removeFromCart(ProductsReponseModel product);

  Future<List<ProductsReponseModel>> getHomeCartProductsFromFirestore();
}
