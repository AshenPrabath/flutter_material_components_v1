import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;

  const InputTextField(
      {super.key, required this.hint, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            }
            return null;
          },
          obscureText: isPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
        ),
      ),
    );
  }
}
