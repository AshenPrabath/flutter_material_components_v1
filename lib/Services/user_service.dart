import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_material_components_v1/Models/user_model.dart'
    as AppUser;
import 'package:flutter_material_components_v1/Source/fake_users.dart';

class UserService {
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

  static Future<void> userLogin(String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> userLogOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
