import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/icons_and_images.dart';
import 'dot_slider.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    super.key,
  });

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.h,
        child: Stack(
          children: [
            PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemCount: 4,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(IconsAndImages.imageProduct))),
                      ),
                      DotSlider(currentindex: currentindex)
                    ],
                  );
                }),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);
                },
                child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: SvgPicture.asset(
                      IconsAndImages.share,
                      width: 20.w,
                      height: 0.h,
                    )),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  margin: const EdgeInsets.all(10),
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
