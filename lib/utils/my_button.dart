import 'package:flutter/material.dart';

class MyButtonDialog extends StatelessWidget {
  MyButtonDialog({super.key, required this.text, required this.onPressed});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xff6750a4),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
