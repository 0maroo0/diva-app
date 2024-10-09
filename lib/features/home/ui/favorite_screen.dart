import 'package:flutter/material.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/spacing.dart';
import 'widget/category_slider.dart';
import 'widget/products.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          verticalSpace(10),
          CategorySlider(categories: categories),
          verticalSpace(10),
          const Products()
        ],
      ),
    );
  }
}
