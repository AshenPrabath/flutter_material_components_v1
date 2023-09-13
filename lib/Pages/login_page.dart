import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Pages/navigation_page.dart';
import 'package:flutter_material_components_v1/Pages/register_page.dart';
import 'package:flutter_material_components_v1/Services/user_service.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: OverflowBar(
                  overflowSpacing: 15,
                  children: <Widget>[
                    const SizedBox(height: 120),
                    Center(
                      child: Image.asset(
                          'lib/assets/logo-no-background 1 (1).png'),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    InputTextField(
                      labelText: "Email Address",
                      hint: "Enter your Email Address",
                      onChanged: (uEmail) {
                        email = uEmail;
                      },
                      isPassword: false,
                    ),
                    InputTextField(
                      labelText: "Password",
                      hint: "Enter your Password",
                      onChanged: (uPassword) {
                        password = uPassword;
                      },
                      isPassword: true,
                    ),
                    CustomFilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          await UserService.userLogin(email, password).then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const NavigationPage(),
                              ),
                            ),
                          );
                        },
                        buttonText: "Login"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
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
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    )
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
