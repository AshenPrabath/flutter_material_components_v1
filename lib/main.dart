import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: lightColorScheme,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 109, 64)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
