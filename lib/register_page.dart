import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/navigation_page.dart';
import 'package:flutter_material_components_v1/widgets/input_dropdown.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
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
                  const InputTextField(
                    hint: "Name",
                    isPassword: false,
                  ),
                  const InputTextField(
                    hint: "Email",
                    isPassword: false,
                  ),
                  const InputTextField(
                    hint: "Phone",
                    isPassword: false,
                  ),
                  const InputDropDown(
                    itemsList: [
                      "Faculty Of Business",
                      "Faculty Of Computing",
                      "Faculty Of Engineering"
                    ],
                    labelText: "Select Faculty",
                  ),
                  const InputTextField(
                    hint: "Password",
                    isPassword: true,
                  ),
                  const InputTextField(
                    hint: "Confirm Password",
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavigationPage()),
                            );
                          },
                          child: const Text("Register")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account??",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Log in",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
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
          ],
        ),
      ),
    );
  }
}
