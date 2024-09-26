
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GridView.builder(
      shrinkWrap: true,
      itemCount: 7,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
        crossAxisCount: 2),
       itemBuilder: (context,i){
        return Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: const DecorationImage(      
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/product1.png'))),
              ),
            ],),
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
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child:  Icon(Icons.star, color: Colors.amber)),
           Text(
        '4.9',
        style: TextStyles.font14DarkBlueBold,
    ),
     ],
       ), 
       
            ],),
            verticalSpace(3),
      Container(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          '545 L.E',
          textAlign: TextAlign.right,
          style: TextStyles.font14DarkBlueBold,
            ),
      ),      
          ],),
        );
       }));
  }
}
