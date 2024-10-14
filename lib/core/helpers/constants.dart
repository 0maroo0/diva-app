import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/features/home/logic/home_cubit.dart';
import 'package:diva/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/cart_screen.dart';
import '../../features/home/ui/categories_home_secreen.dart';
import '../../features/home/ui/favorite_screen.dart';
import 'icons_and_images.dart';

bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}

getScreen(BuildContext context, int index) {
  List<Widget> bottomNavigationHome = [
    BlocProvider(
      create: (context) => HomeCubit(getIt())
        ..fetchHomeProducts()
        ..fetchFavoriteProducts()..fetchCartProducts(),
      child: const HomeScreen(),
    ),
    const CategoriesHomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
  ];
  return bottomNavigationHome[index];
}

List<String> listOfIcons = [
  IconsAndImages.home,
  IconsAndImages.categories,
  IconsAndImages.cartNav,
  IconsAndImages.favorite,
];

List<String> listOfStrings = [
  'Home',
  'category',
  'Cart',
  'Favorite',
];

final List<String> imagePaths = [
  'assets/images/sliderimage.png', // Add your image paths here
  'assets/images/sliderimage.png',
];
final List<String> categories = [
  'All',
  'New in',
  'Men',
  'Women',
  'popular',
  'Formal',
  'bags',
  'phone',
];
