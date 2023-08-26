import 'package:flutter/material.dart';

class InputDropDown extends StatelessWidget {
  final List<String> itemsList;
  final String labelText;
  const InputDropDown(
      {super.key, required this.itemsList, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      
        child: DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          items: itemsList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
                      }).toList(),
          onChanged: (value) {},
        ),
      
    );
  }
}
