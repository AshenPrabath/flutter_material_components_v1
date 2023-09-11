
import 'dart:convert';
import 'package:flutter_material_components_v1/Models/user_model.dart';
import 'package:flutter_material_components_v1/Source/fake_users.dart';

class UserService {
  static Future<List<User>> getAll() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<dynamic> res = json.decode(userRes);
      final List<User> users =
          res.map((e) => User.fromMap(e as Map<String, dynamic>)).toList();
      return users;
    } catch (e) {
      throw e.toString();
    }
  }
}