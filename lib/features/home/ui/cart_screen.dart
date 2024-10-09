import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/colors.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/icons_and_images.dart';
import '../../../core/theming/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.displayHeight / 1.2,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
                height: 550.h,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        height: 140.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppColors.mainColor, width: 2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 120.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: const DecorationImage(
                                  image:
                                      AssetImage(IconsAndImages.imageProduct),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text and icon properly
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Elegant wrapped dress',
                                      style: TextStyles.font14GrayRegular,
                                    ),
                                    SizedBox(
                                        width: 8
                                            .w), // Add space between text and icon
                                    const Icon(Icons.do_not_disturb_on_rounded,
                                        color: AppColors.mainColor),
                                  ],
                                ),
                                Text(
                                  '580 L.E',
                                  style: TextStyles.font18DarkBlueBold,
                                ),
                                verticalSpace(10),
                                Row(
                                  children: [
                                    Container(
                                      width: 90.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.remove,
                                              color: Colors.white),
                                          Text('1',
                                              style:
                                                  TextStyles.font18WhiteMedium),
                                          const Icon(Icons.add,
                                              color: Colors.white)
                                        ],
                                      ),
                                    ),
                                    horizontalSpace(70),
                                    Text('Edit',
                                        style: TextStyles.font14BlueSemiBold),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('total', style: TextStyles.font15DarkBlueBold),
                Text('1,050 L.E', style: TextStyles.font14GrayRegular)
              ],
            ),
            verticalSpace(10),
            AppTextButton(
                buttonText: 'Check out',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
