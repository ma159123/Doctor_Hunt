import 'dart:convert';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/user_model/user_model.dart';

class AuthenticationRepository {
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password, String type) async {
    final response = await http.post(
      Uri.parse('${AppConstants.BASE_URL}/auth/sign-in'),
      body: {
        'email': email,
        'password': password,
        "type": type,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('UserModel.fromJson(data): ${UserModel.fromJson(data).results}');
      return UserModel.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }

  Future<UserModel> registerWithEmailAndPassword(
      String name, String email, String password, String type) async {
    final response = await http.post(
      Uri.parse('${AppConstants.BASE_URL}/auth/sign-up'),
      body: {'name': name, 'email': email, 'password': password, 'type': type},
    );
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Convert the Map object to a UserModel object
      return UserModel.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }
}
