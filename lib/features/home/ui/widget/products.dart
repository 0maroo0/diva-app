import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/icons_and_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6, crossAxisCount: 2),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () => context.pushNamed(Routes.productDetails),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/product1.png'))),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: SvgPicture.asset(IconsAndImages.favorite),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: SvgPicture.asset(
                                      IconsAndImages.cartNav))),
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Baby blue blouse',
                              style: TextStyles.font14GrayRegular,
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(Icons.star, color: Colors.amber)),
                              Text(
                                '4.9',
                                style: TextStyles.font14DarkBlueBold,
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(3),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          '545 L.E',
                          textAlign: TextAlign.right,
                          style: TextStyles.font14DarkBlueBold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
