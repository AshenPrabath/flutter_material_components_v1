import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Pages/navigation_page.dart';
import 'package:flutter_material_components_v1/Services/user_service.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isEmailVerified = false;
  Timer? timer;
  User user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      UserService.sendEmailVerification(user);

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await user.reload();
    setState(() {
      isEmailVerified = user.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const NavigationPage()
      : Scaffold(
          appBar: AppBar(
            title: const Text("Verify email"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Icon(Icons.mail,
                        size: 60, color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "A verification email has been sent to",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    "${user.email}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    "Please check your email to verify your account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomFilledButton(
                        onPressed: () {
                          UserService.sendEmailVerification(
                              FirebaseAuth.instance.currentUser!!);
                        },
                        buttonText: "Resend email"),
                  )
                ],
              ),
            ),
          ),
        );
}
