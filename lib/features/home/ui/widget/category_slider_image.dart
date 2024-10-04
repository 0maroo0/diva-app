import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CategorySliderWithImage extends StatefulWidget {
  const CategorySliderWithImage({
    super.key,
    required this.categories,
  });

  final List<Map<String, dynamic>> categories;

  @override
  State<CategorySliderWithImage> createState() =>
      _CategorySliderWithImageState();
}

class _CategorySliderWithImageState extends State<CategorySliderWithImage> {
  int selectedCategory = 0;
  void onUpdateIndex(int i) {
    setState(() {
      selectedCategory = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          100.h, // Increase the height to accommodate both the image and text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              onUpdateIndex(i);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70.h,
                  width: 70.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.categories[i]['image']),
                    ),
                    color: i == selectedCategory
                        ? AppColors.mainColor.withOpacity(0.3)
                        : AppColors.pink,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.only(right: 10),
                ),
                SizedBox(height: 5.h), // Space between image and text
                Text(
                  widget.categories[i]['name'],
                  style: TextStyles.font15DarkBlueBold,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
