import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/login_page.dart';
import 'package:flutter_material_components_v1/widgets/input_dropdown.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Register',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  height: 30,
                ),
                const InputTextField(
                  hint: "Name",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputTextField(
                  hint: "Email",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputTextField(
                  hint: "Phone",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputDropDown(
                  itemsList: [
                    "Faculty Of Business",
                    "Faculty Of Computing",
                    "Faculty Of Engineering"
                  ],
                  labelText: "Select Faculty",
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputTextField(
                  hint: "Password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputTextField(
                  hint: "Confirm Password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                        onPressed: () {}, child: const Text("Register")),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
