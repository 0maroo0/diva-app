// ignore_for_file: library_private_types_in_public_api
import 'package:diva/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/theming/styles.dart';
import 'widget/color_picker.dart';
import 'widget/product_slider.dart';
import 'widget/size_picker.dart';
import 'widget/title_price_desc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ProductSlider(),
          const TitleAndPriceAndDescription(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Color : Red",
              style: TextStyles.font18DarkBlueSemiBold,
            ),
          ),
          const ColorPicker(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Your size : Large",
              style: TextStyles.font18DarkBlueSemiBold,
            ),
          ),
          const SizePicker(),
          // widget of suggestion product still in developed
          Container()
        ],
      ),
    );
  }
}
