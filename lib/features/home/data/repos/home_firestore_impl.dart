import 'package:diva/core/helpers/firestore_paths.dart';
import 'package:diva/core/networking/firestore_services.dart';
import 'package:diva/features/home/data/apis/home_firestore_service.dart';
import 'package:diva/features/home/data/models/products_reponse_model.dart';

class HomeFirestoreImpl implements HomeFirestoreService {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<ProductsReponseModel>>
      getHomeFavoriteProductsFromFirestore() async {
    try {
      final response = await firestoreService.getCollection(
        path: ApiPaths.getFavorite(),
        builder: (data, documentId) => ProductsReponseModel.fromJson(data),
      );
      return response;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addProductToFavorite(ProductsReponseModel product) async {
    try {
      await firestoreService.setData(
        path: ApiPaths.addToFavorite(product.id.toString()),
        data: product.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> removeProductFromFavorite(ProductsReponseModel product) async {
    try {
      await firestoreService.deleteData(
        path: ApiPaths.removeFavorite(product.id.toString()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> addToCart(ProductsReponseModel product) async {
    try {
      await firestoreService.setData(
        path: ApiPaths.addToCart(product.id.toString()),
        data: product.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> removeFromCart(ProductsReponseModel product) async {
    try {
      await firestoreService.deleteData(
        path: ApiPaths.removeFromCart(product.id.toString()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<ProductsReponseModel>> getHomeCartProductsFromFirestore() async {
    try {
      final response = await firestoreService.getCollection(
        path: ApiPaths.getCart(),
        builder: (data, documentId) => ProductsReponseModel.fromJson(data),
      );
      return response;
    } catch (e) {
      return [];
    }
  }
}
