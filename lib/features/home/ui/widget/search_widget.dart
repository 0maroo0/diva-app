import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'search',
              validator: (val) {},
              suffixIcon: SvgPicture.asset(
                'assets/images/search.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          horizontalSpace(10),
          SvgPicture.asset('assets/images/filter.svg')
        ],
      ),
    );
  }
}
