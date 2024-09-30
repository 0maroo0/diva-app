import 'package:diva/core/helpers/icons_and_images.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

import 'widget/category_slider_image.dart';
import 'widget/products.dart';

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'name': "Jacket", "image": IconsAndImages.jacket},
      {'name': "Trousers", "image": IconsAndImages.trousers},
      {'name': "hijab", "image": IconsAndImages.shirt},
      {'name': "shoes", "image": IconsAndImages.shoes},
      {'name': "Jacket", "image": IconsAndImages.jacket},
      {'name': "Trousers", "image": IconsAndImages.trousers},
      {'name': "hijab", "image": IconsAndImages.shirt},
      {'name': "shoes", "image": IconsAndImages.shoes},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyles.font15DarkBlueBold,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            CategorySliderWithImage(categories: categories),
            verticalSpace(10),
            const Products()
          ],
        ),
      ),
    );
  }
}
