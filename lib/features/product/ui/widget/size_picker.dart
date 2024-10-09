import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key});

  @override
  _SizePickerState createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  // List of sizes to display
  final List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
  // Index of the selected size
  int selectedSizeIndex = -1; // -1 means no size selected

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(sizes.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSizeIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == selectedSizeIndex
                  ? AppColors.mainColor
                  : AppColors.pink,
            ),
            child: Text(
              sizes[index],
              style: TextStyle(
                color: index == selectedSizeIndex
                    ? Colors.white
                    : AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }
}
