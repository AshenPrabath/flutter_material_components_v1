import 'package:flutter/material.dart';
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
