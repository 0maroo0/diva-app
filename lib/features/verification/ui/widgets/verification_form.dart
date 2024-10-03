import 'dart:async';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/colors.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key});

  @override
  VerificationFormState createState() => VerificationFormState();
}

class VerificationFormState extends State<VerificationForm> {
  Timer? _timer;
  int _counter = 30;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          hintCharacter: '-',
          hintStyle: TextStyles.font14BlueSemiBold.copyWith(
            color: Colors.black.withOpacity(0.4),
            fontSize: 24,
          ),
          appContext: context,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          textStyle: TextStyles.font14BlueSemiBold.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
          cursorColor: Colors.black,
          cursorHeight: 20,
          pinTheme: PinTheme(
            borderRadius: BorderRadius.circular(100),
            borderWidth: 0.95,
            fieldHeight: 48,
            fieldWidth: 64,
            activeFillColor: AppColors.mainColor.withOpacity(1.0),
            inactiveFillColor: Colors.white,
            selectedFillColor: AppColors.mainColor.withOpacity(0.2),
            activeColor: AppColors.mainColor,
            inactiveColor: const Color(0xB3B3B380).withOpacity(0.3),
            selectedColor: const Color(0xB3B3B380).withOpacity(0.3),
            shape: PinCodeFieldShape.box,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          onCompleted: (v) {
            print('Completed');
          },
          onChanged: (value) {
            print(value);
          },
        ),
        verticalSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            'Resend code in ${_counter}s',
            style: TextStyles.font14RobotoRegular.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
