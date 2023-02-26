import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String textContent;
  final String? imageUrl;

  const ErrorText({
    super.key,
    required this.textContent,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrl != null)
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(imageUrl!, scale: 2.5),
          ),
        Text(
          textContent,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
