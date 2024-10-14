import 'package:diva/features/home/data/models/products_reponse_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  final List<ProductsReponseModel> products;

  ProductsSuccess(this.products);
}

class ProductsFailure extends HomeState {
  final String error;

  ProductsFailure(this.error);
}

class FavoritesUpdated extends HomeState {
  final ProductsReponseModel favoriteProducts;

  FavoritesUpdated(this.favoriteProducts);
}

class CartUpdated extends HomeState {
  final ProductsReponseModel cartProducts;

  CartUpdated(this.cartProducts);
}
