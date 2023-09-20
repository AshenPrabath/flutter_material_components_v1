import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_material_components_v1/Models/user_model.dart'
    as AppUser;
import 'package:flutter_material_components_v1/Source/fake_users.dart';

class AuthFailure {
  final String message;
  AuthFailure({
    required this.message,
  });
}

class UserService {
  static bool get isSignedIn =>
      FirebaseAuth.instance.currentUser != null ? true : false;

  static String getUserId() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw AuthFailure(message: "User not found");
  }

  static String getEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    }
    throw AuthFailure(message: "User not found");
  }

  static Future<List<AppUser.User>> getAll() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<dynamic> res = json.decode(userRes);
      final List<AppUser.User> users = res
          .map((e) => AppUser.User.fromMap(e as Map<String, dynamic>))
          .toList();
      return users;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<AppUser.User> getUser({required String id}) async {
    try {
      final users = await getAll();
      for (var user in users) {
        if (user.id == id) {
          return user;
        }
      }
      throw Exception("User not found for ID");
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> userLogin(
      BuildContext context, userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthFailure(message: 'Invalid Login credentials');
      } else {
        throw AuthFailure(message: "Unknown Error occurred");
      }
    } catch (e) {
      throw AuthFailure(message: "message");
    }
  }

  static Future<void> userLogOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> userRegister(
    String userName,
    String userEmail,
    String userPhone,
    String userFaculty,
    String userPassword,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      user = userCredential.user;
      await user!.updateDisplayName(userName);
      await user.reload();
      user = auth.currentUser;

      FirebaseFirestore.instance.collection('user').doc(user!.uid).set({
        'name': userName,
        'email': userEmail,
        'phone': userPhone,
        'faculty': userFaculty,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'EMAIL_ALREADY_IN_USE') {
        throw AuthFailure(message: 'Email already in use');
      } else {
        throw AuthFailure(message: "Unknown Error occurred");
      }
    } catch (e) {
      throw AuthFailure(message: "message");
    }
  }

  static Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } catch (e) {
      throw AuthFailure(message: "Failed to send email verification");
    }
  }

  static bool isVerified() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.emailVerified;
    }
    return false;
  }

  // static Stream<bool> listenEmailVerification() async* {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     yield* Stream<bool>.periodic(const Duration(seconds: 1), (count) {});
  //   }
  //   throw AuthFailure(message: "Failed to listen email verification");
  // }

  static Future<void> checkEmailVerificationStatus(
      {required Function(int) onWaiting,
      required Function() onSucceed,
      required Function() onWaitingEnd,
      required Function(AuthFailure) onFailed}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      bool isSucceed = false;
      for (var i = 0; i < 30; i++) {
        final User userForCheck = FirebaseAuth.instance.currentUser!;
        await Future.delayed(const Duration(seconds: 1));
        await userForCheck.reload();
        if (userForCheck.emailVerified) {
          isSucceed = true;
          break;
        }
        if (!userForCheck.emailVerified) {
          onWaiting(i);
        }
      }
      if (isSucceed) {
        onSucceed();
      } else {
        onWaitingEnd();
      }
    } else {
      onFailed(AuthFailure(message: "User not found"));
    }
  }

  static Future<void> resetPassword(
      String userEmail, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: userEmail,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not found"),
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
