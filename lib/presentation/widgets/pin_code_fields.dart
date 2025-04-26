import 'package:flutter/material.dart';
import 'package:firebase_phone_auth/constant/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatelessWidget {
  final Function(String) onComplete;
  const PinCodeFields({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
          borderWidth: 1,
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: MyColors.blue,
          inactiveColor: MyColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: MyColors.lightBlue,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: onComplete,
        onChanged: (value) {},
      ),
    );
  }
}
