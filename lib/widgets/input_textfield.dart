import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final bool? isPassword;
  final IconData? suffixIcon;
  final double? width;
  final Function(String) onChanged;
  const InputTextField({
    Key? key,
    required this.hint,
    this.isPassword,
    this.suffixIcon,
    this.width,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          }
          return null;
        },
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon),
          border: const OutlineInputBorder(),
          labelText: hint,
        ),
      ),
    );
  }
}
