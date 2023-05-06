import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  Dio dio;
  ApiServices({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    print('$_baseUrl$endPoint');
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
