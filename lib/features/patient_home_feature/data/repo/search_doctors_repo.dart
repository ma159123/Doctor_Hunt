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
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
          });
      final data = jsonDecode(response.body);
      return Right(DoctorsModel.fromJson(data));
    } catch (e) {
      print('get doctors(repo) error:mmmmm}');
      return Left(Failure(e.toString()));
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }
}
