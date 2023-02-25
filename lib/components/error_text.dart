import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String textContent;

  const ErrorText({
    super.key, required this.textContent,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
