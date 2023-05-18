import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:doctor_hunt/features/book_feature/data/models/apointment_model/apointment_model.dart';
import 'package:doctor_hunt/features/book_feature/data/models/available_appointments.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_appointments_model/get_appointments_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/network_info.dart';

class AppointmentRepository {
  late final NetworkInfo networkInfo;

  Future<Either<Failure, GetAppointmentsModel>> getPatientAppointments(
      {required String patientID}) async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http.get(
          Uri.parse(
              '${AppConstants.BASE_URL}/api/appointment?patient=$patientID'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
          });
      final data = jsonDecode(response.body);
      print('getPatientAppointments(repo) success:${response.body}}');
      return Right(GetAppointmentsModel.fromJson(data));
    } on ServerException {
      print('getPatientAppointments(repo) error:mmmmm}');
      return Left(ServerFailure());
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }


  Future<Either<Failure, AvailableAppointments>> getAvailableAppointmentsForDoctor(
      {required String doctorID}) async {
    print(doctorID);
    // if(await networkInfo.isConnected){
    try {
      final response = await http.get(
          Uri.parse(
              '${AppConstants.BASE_URL}/api/doctor-appointments/$doctorID'),
          headers: {
            'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
          });
      final data = jsonDecode(response.body);
      print('getAvailableAppointmentsForDoctor(repo) success:${response.body}}');
      return Right(AvailableAppointments.fromJson(data));
    } on ServerException {
      print('getAvailableAppointmentsForDoctor(repo) error}');
      return Left(ServerFailure());
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }

  Future<Either<Failure, AppointmentModel>> createAppointment({
    required DateTime date,
    required String doctorID,
    required String patientID,
    required String state,
    required String online,
    required String cost,
    required String notes,
  }) async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http
          .post(Uri.parse('${AppConstants.BASE_URL}/api/appointment'), body: {
        'date': date,
        'doctor': doctorID,
        "patient": patientID,
        'online': online,
        'state': state,
        'cost': cost,
        'notes': notes,
      }, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
      });
      final data = jsonDecode(response.body);
      print('make appointment (repo) success:${response.body}}');
      return Right(AppointmentModel.fromJson(data));
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
