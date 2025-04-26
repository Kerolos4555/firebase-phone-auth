import 'package:flutter/material.dart';
import 'package:firebase_phone_auth/constant/my_colors.dart';
import 'package:firebase_phone_auth/presentation/widgets/egypt_phone_code.dart';
import 'package:firebase_phone_auth/presentation/widgets/phone_number_field.dart';

class PhoneForm extends StatelessWidget {
  final Function(String?) save;

  const PhoneForm({
    super.key,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const EgyptPhoneCode(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.blue,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  6,
                ),
              ),
            ),
            child: PhoneNumberField(
              save: save,
            ),
          ),
        ),
      ],
    );
  }
}
