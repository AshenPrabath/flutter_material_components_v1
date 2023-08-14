import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;
  const MyTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 56,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
        ),
      ),
    );
  }
}
