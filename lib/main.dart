import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Auth/auth_page.dart';
import 'package:flutter_material_components_v1/Pages/navigation_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: lightColorScheme,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 109, 64)),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
