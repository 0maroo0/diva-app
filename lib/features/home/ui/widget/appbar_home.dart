

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.h,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(children: [
         const CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png'
          , 
          
          ),
       ), 
       horizontalSpace(10),
        Text(
      'Welcome , Marwan',
      style: TextStyles.font13RobotoRegular,
    ),
        ],), 
        Row(children: [
          SvgPicture.asset('assets/images/notification.svg'),
       horizontalSpace(10),
    
          SvgPicture.asset('assets/images/search.svg') ,
       horizontalSpace(4),
    
          ],)
      ],),
    );
  }
}
