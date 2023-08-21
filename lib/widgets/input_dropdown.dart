import 'package:flutter/material.dart';

class InputDropDown extends StatefulWidget {
  const InputDropDown({super.key});

  @override
  State<InputDropDown> createState() => _InputDropDownState();
}

class _InputDropDownState extends State<InputDropDown> {
  String selectedOption = 'Option 1';
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 56,
      ),
    );
  }
}
