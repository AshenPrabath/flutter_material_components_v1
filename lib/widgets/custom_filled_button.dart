import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: buttonTextColor),
        ),
      ),
    );
  }
}
