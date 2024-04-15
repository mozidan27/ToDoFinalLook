import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.buttonName,
  });
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        buttonName,
        style: const TextStyle(
            color: Color(0xffb28bfe),
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
    );
  }
}
