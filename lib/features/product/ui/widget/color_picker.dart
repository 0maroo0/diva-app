import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  // List of colors to display
  final List<Color> colors = [
    const Color(0xff5C362B),
    const Color(0xffCB848C),
    const Color(0xff934A5B),
    const Color(0xff9677f0a3),
    const Color(0xffD10101),
    const Color(0xff5C362B),
  ];
  // Index of the selected color
  int selectedColorIndex = -1; // -1 means no color selected

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(colors.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColorIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: index == selectedColorIndex
                    ? Border.all(color: Colors.black, width: 3)
                    : null,
                color: colors[index],
                shape: BoxShape.circle,
              ),
            ),
          );
        }));
  }
}
