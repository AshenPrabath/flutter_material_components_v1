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
                      labelText: "Name",
                      hint: "Enter your Name",
                      onChanged: (name) {},
                      isPassword: false,
                    ),
                    InputTextField(
                      labelText: "Email Address",
                      hint: "Enter your Email Address ",
                      textInputType: TextInputType.emailAddress,
                      onChanged: (email) {},
                      isPassword: false,
                    ),
                    InputTextField(
                      labelText: "Phone",
                      hint: "Enter your Name",
                      textInputType: TextInputType.phone,
                      onChanged: (phone) {},
                      isPassword: false,
                    ),
                    InputDropDown(
                      onChanged: (value) {},
                      itemsList: facultyList,
                      labelText: "Select Faculty",
                    ),
                    InputTextField(
                      labelText: "Password",
                      hint: "Set a new password",
                      onChanged: (name) {},
                      isPassword: true,
                    ),
                    InputTextField(
                      labelText: "Confirm Password",
                      hint: "re type password",
                      onChanged: (name) {},
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
