import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final Function(String?) save;
  const PhoneNumberField({
    super.key,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(
        fontSize: 18,
        letterSpacing: 2,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone number!';
        } else if (value.length != 11) {
          return 'Please enter a valid number';
        } else {
          return null;
        }
      },
      onSaved: save,
    );
  }
}
