import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/my_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      //   title: const Text("Home"),
      // ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 150),
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 52),
                MyTextField(
                  hint: "Email Address",
                  onChanged: (text) => print(text),
                ),
                const SizedBox(height: 22),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 56,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(onPressed: () {}, child: Text("Login")),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "dont have an account?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      " Register",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
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
