import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomFilledButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
