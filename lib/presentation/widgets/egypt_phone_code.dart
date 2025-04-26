import 'package:flutter/material.dart';
import 'package:firebase_phone_auth/constant/my_colors.dart';
import 'package:firebase_phone_auth/helper/generate_egypt_flag.dart';

class EgyptPhoneCode extends StatelessWidget {
  const EgyptPhoneCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.lightGrey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              6,
            ),
          ),
        ),
        child: Text(
          '${generateEgyptFlag()} +20',
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
