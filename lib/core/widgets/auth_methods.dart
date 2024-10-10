import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthMethods extends StatelessWidget {
  const AuthMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircleButton(
          svgPath: 'assets/svgs/google.svg',
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        _buildCircleButton(
          svgPath: 'assets/svgs/facebook.svg',
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        _buildCircleButton(
          svgPath: 'assets/svgs/apple.svg',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCircleButton({
    required String svgPath,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svgPath,
          ),
        ),
      ),
    );
  }
}
