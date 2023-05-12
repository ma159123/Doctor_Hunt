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

  Future<UserModel> updateUser({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String dateOfBirth,
    required String? favoriteDoctors,
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
        "favoriteDoctors": favoriteDoctors,
      },
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

  // var headers = {
  //   'Content-Type': 'application/json',
  //   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ0ZGEyMDc1YzdkZjE0Yzc3NWFjNjAzIiwiaWF0IjoxNjgyODA5MzUxLCJleHAiOjE3MTQzNDUzNTF9.G8RZMUgP_p63j5jOiErrWj2STEz6H_W3DgCPuZT9Vc0'
  // };
  // var request = http.Request('PUT', Uri.parse('http://206.81.19.12:6060/api/patient/644b02bdfd1538fe902af43c'));
  // request.body = json.encode({
  // "name": "John Doe",
  // "email": "johndoe@example.com",
  // "password": "password123",
  // "DateOfBirth": "1990-01-01",
  // "gender": true,
  // "balance": 0,
  // "banned": false,
  // "favoriteDoctors": [
  // "644b136539f43985aa7536e7"
  // ]
  // });
  // request.headers.addAll(headers);
  //
  // http.StreamedResponse response = await request.send();
  //
  // if (response.statusCode == 200) {
  // print(await response.stream.bytesToString());
  // }
  // else {
  // print(response.reasonPhrase);
  // }
}
