import 'package:flutter/material.dart';

class InputDropDown extends StatefulWidget {
  const InputDropDown({super.key});

  @override
  State<InputDropDown> createState() => _InputDropDownState();
}

class _InputDropDownState extends State<InputDropDown> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'select Faculty',
            border: OutlineInputBorder(),
          ),
          items: ['Faculty of computing','Faculty of Business','Faculty of Science'].map((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
            
          }).toList(),
          onChanged: (value) {},

        ),
      ),
    );
  }
}
