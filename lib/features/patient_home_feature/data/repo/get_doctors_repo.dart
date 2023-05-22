import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/network_info.dart';
import '../models/doctor_model/doctor_model.dart';
import '../models/doctors_model/doctors_model.dart';

class GetDoctorsRepository {
  late final NetworkInfo networkInfo;

  // Future<DoctorsModel> getAllDoctors() async {
  //   try{
  //     final response = await http.get(
  //       Uri.parse(AppConstants.GET_DOCTOR_URL),
  //     );
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       print('DoctorsModel.fromJson(data):${DoctorsModel.fromJson(data)}');
  //     } else {
  //       throw 'Some error happened.';
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  //
  //   return DoctorsModel.fromJson(data);
  //
  // }
  // @override
  Future<Either<Failure, DoctorsModel>> getAllDoctors() async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.BASE_URL}/api/doctor'), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
      });
      final data = jsonDecode(response.body);
      //print('get doctors success: ${data.toString()}');
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

  Future<Either<Failure, DoctorModel>> getDoctorsById(
      {required String id}) async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.BASE_URL}/api/doctor/$id'), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
      });
      final data = jsonDecode(response.body);
      //print('get doctors success: ${data.toString()}');
      return Right(DoctorModel.fromJson(data));
    } catch (e) {
      print('get doctors(repo) error:mmmmm}');
      return Left(Failure(e.toString()));
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }

  Future<Either<Failure, DoctorsModel>> getDoctorsByCategories(
      {required String? categoryId}) async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http.get(
          Uri.parse(
              '${AppConstants.BASE_URL}/api/doctor?value=$categoryId&field=category'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
          });
      final data = jsonDecode(response.body);
      //print('get doctors success: ${data.toString()}');
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
