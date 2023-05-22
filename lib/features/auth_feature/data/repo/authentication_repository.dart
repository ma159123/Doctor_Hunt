import 'dart:convert';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:http/http.dart' as http;

import '../models/user_model_as_doctor/user_model.dart';
import '../models/user_model_as_patient/user_model_as_patient.dart';

class AuthenticationRepository {
  Future<UserModelAsDoctor> signInForDoctors(
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
      print(
          'UserModel.fromJson(data): ${UserModelAsDoctor.fromJson(data).results}');
      return UserModelAsDoctor.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }

  Future<UserModelAsPatient> signInForPatient(
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
      print(
          'UserModel.fromJson(data): ${UserModelAsPatient.fromJson(data).result}');
      return UserModelAsPatient.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }

  Future<UserModelAsDoctor> registerForDoctors(
      String name, String email, String password, String type) async {
    final response = await http.post(
      Uri.parse('${AppConstants.BASE_URL}/auth/sign-up'),
      body: {'name': name, 'email': email, 'password': password, 'type': type},
    );
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Convert the Map object to a UserModel object
      return UserModelAsDoctor.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }

  Future<UserModelAsPatient> registerForPatient(
      String name, String email, String password, String type) async {
    final response = await http.post(
      Uri.parse('${AppConstants.BASE_URL}/auth/sign-up'),
      body: {'name': name, 'email': email, 'password': password, 'type': type},
    );
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Convert the Map object to a UserModel object
      return UserModelAsPatient.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }

  Future<UserModelAsPatient> updateUser({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String dateOfBirth,
    String? image,
    required List<dynamic>? favoriteDoctors,
  }) async {
    final response = await http.put(
      Uri.parse('${AppConstants.BASE_URL}/api/patient/$userId'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ0ZGEyMDc1YzdkZjE0Yzc3NWFjNjAzIiwiaWF0IjoxNjgyODA5MzUxLCJleHAiOjE3MTQzNDUzNTF9.G8RZMUgP_p63j5jOiErrWj2STEz6H_W3DgCPuZT9Vc0'
      },
      body: {
        'name': name,
        'email': email,
        'password': password,
        "DateOfBirth": dateOfBirth,
        "favoriteDoctors": favoriteDoctors??[],
        "image": image,
        "balance":'10000',
      },
    );
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Convert the Map object to a UserModel object
      return UserModelAsPatient.fromJson(data);
    } else {
      throw 'Some error happened.';
    }
  }
}
