import 'package:diva/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/ui/categories_home_secreen.dart';
import 'icons_and_images.dart';

bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}
List<Widget> bottomNavigationHome=const[
  HomeScreen(), CategoriesHomeScreen(), Text('data'), Text('data')
];

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