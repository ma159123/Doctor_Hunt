import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/network_info.dart';
import '../models/doctors_model/doctors_model.dart';

class SearchDoctorsRepository {
  late final NetworkInfo networkInfo;

  Future<Either<Failure, DoctorsModel>> searchDoctors({String? name}) async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http.get(
          Uri.parse('${AppConstants.BASE_URL}/api/doctor?q=$name'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NGFjY2JkOGYwZjkxZmQ1ZjQxZTkwMCIsImlhdCI6MTY4MjYyNjAzMH0.55-x4P9B9RmaBUQiUR3yg3ZzE2x2OQDWvHL7G36eFzA'
          });
      final data = jsonDecode(response.body);
      return Right(DoctorsModel.fromJson(data));
    } on ServerException {
      print('get doctors(repo) error:mmmmm}');
      return Left(ServerFailure());
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }
}
