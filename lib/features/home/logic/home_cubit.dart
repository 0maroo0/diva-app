import 'package:diva/features/home/data/models/products_reponse_model.dart';
import 'package:diva/features/home/data/repos/home_firestore_impl.dart';
import 'package:diva/features/home/data/repos/home_repo.dart';
import 'package:diva/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;
  final HomeFirestoreImpl homeFirestoreImpl = HomeFirestoreImpl();

  List<ProductsReponseModel> favoriteProducts = [];
  List<ProductsReponseModel> allProducts = [];
  List<ProductsReponseModel> cartProducts = [];
  Future<void> fetchHomeProducts() async {
    emit(ProductsLoading());
    final result = await _homeRepo.getHomeProducts();
    result.when(
      success: (products) {
        allProducts = products;
        emit(ProductsSuccess(products));
      },
      failure: (error) {
        emit(ProductsFailure(error.apiErrorModel.message.toString()));
      },
    );
  }

  Future<List<ProductsReponseModel>> fetchFavoriteProducts() async {
    favoriteProducts =
        await homeFirestoreImpl.getHomeFavoriteProductsFromFirestore();
    emit(ProductsSuccess(allProducts));
    return favoriteProducts;
  }

  Future<void> toggleFavorite(ProductsReponseModel product) async {
    final products =
        await homeFirestoreImpl.getHomeFavoriteProductsFromFirestore();

    bool isFound = products.any((element) => element.id == product.id);
    if (isFound) {
      homeFirestoreImpl.removeProductFromFavorite(product);
    } else {
      homeFirestoreImpl.addProductToFavorite(product);
    }
    favoriteProducts =
        await homeFirestoreImpl.getHomeFavoriteProductsFromFirestore();

    emit(FavoritesUpdated(product));
  }

  bool isFavorite(ProductsReponseModel product) {
    return favoriteProducts.any((element) => element.id == product.id);
  }

  Future<void> toggleCart(ProductsReponseModel product) async {
    final products = await homeFirestoreImpl.getHomeCartProductsFromFirestore();

    bool isFound = products.any((element) => element.id == product.id);
    if (isFound) {
      homeFirestoreImpl.removeFromCart(product);
    } else {
      homeFirestoreImpl.addToCart(product);
    }
    cartProducts = await homeFirestoreImpl.getHomeCartProductsFromFirestore();

    emit(CartUpdated(product));
  }

  bool isCart(ProductsReponseModel product) {
    return cartProducts.any((element) => element.id == product.id);
  }

  Future<List<ProductsReponseModel>> fetchCartProducts() async {
    cartProducts = await homeFirestoreImpl.getHomeCartProductsFromFirestore();
    emit(ProductsSuccess(allProducts));
    return cartProducts;
  }
}
