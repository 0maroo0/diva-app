import 'package:firebase_auth/firebase_auth.dart';

class ApiPaths {
  static String userId() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.uid ?? 'guest';
  }

  static String user() => 'users/${userId()}';
  static String addToFavorite(String id) => 'users/${userId()}/favorites/$id';

  static String getFavorite() => 'users/${userId()}/favorites/';

  static String removeFavorite(String id) => 'users/${userId()}/favorites/$id';

  static String addToCart(String id) => 'users/${userId()}/cart/$id';

  static String removeFromCart(String id) => 'users/${userId()}/cart/$id';

  static String getCart() => 'users/${userId()}/cart/';
}
