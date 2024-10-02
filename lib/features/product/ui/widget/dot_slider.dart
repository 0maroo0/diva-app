import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class DotSlider extends StatelessWidget {
  const DotSlider({
    super.key,
    required this.currentindex,
  });

  final int currentindex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the Row

        children: [
          ...List.generate(
              4,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(left: 7),
                    duration: const Duration(milliseconds: 700),
                    height: 10.h,
                    width: index == currentindex ? 20.h : 10.h,
                    decoration: BoxDecoration(
                        color: index == currentindex
                            ? AppColors.mainColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
