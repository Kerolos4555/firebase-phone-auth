import 'package:flutter/material.dart';
import 'package:firebase_phone_auth/constant/my_colors.dart';

class VerifyText extends StatelessWidget {
  const VerifyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your phone number',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: RichText(
            text: const TextSpan(
              text: 'Enter your 6 digit code numbers sent to this number.  ',
              style: TextStyle(
                fontSize: 18,
                height: 1.4,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '+201206846301',
                  style: TextStyle(
                    color: MyColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
