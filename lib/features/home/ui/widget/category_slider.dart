
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50.h, 
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context,i){
        return Container(
          alignment: Alignment.center,
          decoration:  BoxDecoration(color: AppColors.pink , borderRadius:
          BorderRadius.circular(25)
           ),
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(vertical:  5, horizontal: 15),
        child: Text(
      categories[i],
      style: TextStyles.font14BlueSemiBold,
    ),
        );
      }),
    );
  }
}
