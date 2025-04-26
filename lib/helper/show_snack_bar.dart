import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 10),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
