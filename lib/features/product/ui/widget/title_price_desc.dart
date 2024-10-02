import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class TitleAndPriceAndDescription extends StatelessWidget {
  const TitleAndPriceAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Baby blue blouse',
                  style: TextStyles.font18DarkBlueBold,
                ),
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.star, color: Colors.amber)),
                  Text(
                    '4.9(999+)',
                    style: TextStyles.font14GrayRegular,
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
              style: TextStyles.font15DarkBlueBold,
            ),
          ),
          verticalSpace(3),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Italian silky dress with wrapped waist bla bla bla bla bla bla bla bla',
              style: TextStyles.font14GrayRegular,
            ),
          ),
        ],
      ),
    );
  }
}
