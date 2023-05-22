import 'dart:convert';

import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_patient/user_model_as_patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/local/cache.dart';
import '../../data/models/user_model_as_doctor/user_model.dart';
import '../../data/repo/authentication_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthenticationRepository _authRepository;

  AuthCubit({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isSecurePass = true;
  void showPassword() {
    isSecurePass = !isSecurePass;
    emit(ChangePassAppearanceSuccessState());
  }

  UserModelAsDoctor? userModelAsDoctor;
  UserModelAsPatient? userModelAsPatient;
  Future<void> signInForDoctors(
      String email, String password, String type) async {
    emit(SignInDoctorsLoadingState());
    try {
      final authResponse =
          await _authRepository.signInForDoctors(email, password, type);
      userModelAsDoctor = authResponse;
      CacheHelper.saveData(
        key: 'doctor',
        value: jsonEncode(userModelAsDoctor),
      )!
          .then((value) {
        print('user id saved successfully: ${authResponse.message}');
      }).catchError((error) {});
      print('user model :  ${userModelAsDoctor?.results}');
      print(' authResponse :  ${authResponse.message}');
      emit(SignInDoctorsSuccessState(authResponse));
    } catch (e) {
      emit(SignInDoctorsErrorState(e.toString()));
      rethrow;
    }
  }

  Future<void> signInForPatients(
      String email, String password, String type) async {
    emit(SignInPatientLoadingState());
    try {
      final authResponse =
          await _authRepository.signInForPatient(email, password, type);
      userModelAsPatient = authResponse;
      CacheHelper.saveData(
        key: 'patient',
        value: jsonEncode(userModelAsPatient),
      )!
          .then((value) {
        print('user id saved successfully: ${authResponse.message}');
      }).catchError((error) {});
      print('user model :  ${userModelAsPatient?.result}');
      print(' authResponse :  ${authResponse.message}');
      emit(SignInPatientSuccessState(authResponse));
    } catch (e) {
      emit(SignInPatientErrorState(e.toString()));
      rethrow;
    }
  }

  Future<void> registerForPatient(
      String name, String email, String password, String type) async {
    emit(SignUpPatientLoadingState());
    try {
      final authResponse =
          await _authRepository.registerForPatient(name, email, password, type);
      userModelAsPatient = authResponse;
      print('response: $userModelAsPatient');
      emit(SignUpPatientSuccessState(authResponse));
    } catch (e) {
      emit(SignUpPatientErrorState(e.toString()));
      rethrow;
    }
  }

  Future<void> registerForDoctors(
      String name, String email, String password, String type) async {
    emit(SignUpDoctorsLoadingState());
    try {
      final authResponse =
          await _authRepository.registerForDoctors(name, email, password, type);
      userModelAsDoctor = authResponse;
      print('response: $userModelAsDoctor');
      emit(SignUpDoctorsSuccessState(authResponse));
    } catch (e) {
      emit(SignUpDoctorsErrorState(e.toString()));
      rethrow;
    }
  }

  Future<void> updatePatient(
      {String? userId,
      String? name,
      String? email,
      String? password,
      String? dateOfBirth,
      String? image,
      List<dynamic>? favoriteDoctors}) async {
    emit(UpdateUserLoadingState());
    try {
      final authResponse = await _authRepository.updateUser(
        userId: userId ?? userModelAsPatient!.result!.id!,
        name: name ?? userModelAsPatient!.result!.name!,
        email: email ?? userModelAsPatient!.result!.email!,
        password: password ?? userModelAsPatient!.result!.password!,
        dateOfBirth: dateOfBirth ??
            DateFormat('yyyy-MM-dd').format(
                userModelAsPatient!.result?.dateOfBirth ?? DateTime.now()),
        favoriteDoctors:
            favoriteDoctors ?? userModelAsPatient!.result?.favoriteDoctors,
        image: image??userModelAsPatient!.result?.image,
      );
      userModelAsPatient = const UserModelAsPatient();
      userModelAsPatient = authResponse;
      CacheHelper.saveData(
        key: 'patient',
        value: jsonEncode(userModelAsPatient),
      )!
          .then((value) {
        print('user id saved successfully: ${authResponse.message}');
      }).catchError((error) {});
      print('response: $userModelAsPatient');
      emit(UpdateUserSuccessState(authResponse));
    } catch (e) {
      emit(UpdateUserErrorState(e.toString()));
      rethrow;
    }
  }

  void signOut(BuildContext context) {
    if (userModelAsPatient?.result != null) {
      CacheHelper.removeData(
        key: 'patient',
      )!
          .then((value) {
        print('patient id removed successfully');
      }).catchError((error) {});
    } else {
      CacheHelper.removeData(
        key: 'doctor',
      )!
          .then((value) {
        print('doctor id removed successfully');
      }).catchError((error) {});
    }

    // emit(AuthStates(response: null));
  }
}
