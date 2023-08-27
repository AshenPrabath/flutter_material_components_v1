import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/register_page.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: OverflowBar(
                overflowSpacing: 15,
                children: <Widget>[
                  const SizedBox(height: 150),
                  Center(
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const InputTextField(
                    hint: "Email Address",
                    isPassword: false,
                  ),
                  const InputTextField(
                    hint: 'Password',
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
                          }, child: const Text("Login")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "dont have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                        child: Text(
                          " Register",
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
      ),
    );
  }
}
