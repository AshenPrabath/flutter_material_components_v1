import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';
import 'package:flutter_material_components_v1/widgets/input_dropdown.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';

import 'navigation_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _name = TextEditingController();
  List<String> facultyList = [
    "Faculty Of Business",
    "Faculty Of Computing",
    "Faculty Of Engineering"
  ];
  final String faculty = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: OverflowBar(
                  overflowAlignment: OverflowBarAlignment.start,
                  overflowSpacing: 15,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Register',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    InputTextField(
                      onChanged: (name) {},
                      hint: "Name",
                      isPassword: false,
                    ),
                    InputTextField(
                      onChanged: (name) {},
                      hint: "Email",
                      isPassword: false,
                    ),
                    InputTextField(
                      onChanged: (name) {},
                      hint: "Phone",
                      isPassword: false,
                    ),
                    InputDropDown(
                      onChanged: (value) {},
                      itemsList: facultyList,
                      labelText: "Select Faculty",
                    ),
                    InputTextField(
                      onChanged: (name) {},
                      hint: "Password",
                      isPassword: true,
                    ),
                    InputTextField(
                      onChanged: (name) {},
                      hint: "Confirm Password",
                      isPassword: true,
                    ),
                    CustomFilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavigationPage()),
                          );
                        },
                        buttonText: "Register"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account??",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            " Log in",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
