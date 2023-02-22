import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;

  const InputField({
    super.key, required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
