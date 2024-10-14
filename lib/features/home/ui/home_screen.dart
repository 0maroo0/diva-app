import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/spacing.dart';
import 'widget/appbar_home.dart';
import 'widget/category_slider.dart';
import 'widget/products.dart';
import 'widget/search_widget.dart';
import 'widget/slider_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarHome(),
                const SearchWidget(),
                SliderHome(imagePaths: imagePaths),
                verticalSpace(10),
                CategorySlider(categories: categories),
                verticalSpace(10),
                const Products()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
