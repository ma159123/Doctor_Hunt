import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/local/cache.dart';
import '../../data/models/user_model/user_model.dart';
import '../../data/repo/authentication_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthenticationRepository _authRepository;

  AuthCubit({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> signInWithEmailAndPassword(
      String email, String password, String type) async {
    emit(SignInLoadingState());
    try {
      final authResponse = await _authRepository.signInWithEmailAndPassword(
          email, password, type);
      userModel = authResponse;
      CacheHelper.saveData(
        key: 'user',
        value: jsonEncode(userModel),
      )!
          .then((value) {
        print('user id saved successfully: ${authResponse.message}');
      }).catchError(() {});
      print('user model :  ${userModel?.results}');
      print(' authResponse :  ${authResponse.message}');
      emit(SignInSuccessState(authResponse));
    } catch (e) {
      emit(SignInErrorState(e.toString()));
      throw e;
    }
  }

  Future<void> registerWithEmailAndPassword(
      String name, String email, String password, String type) async {
    emit(SignUpLoadingState());
    try {
      final authResponse = await _authRepository.registerWithEmailAndPassword(
          name, email, password, type);
      userModel = authResponse;
      print('response: $userModel');
      emit(SignUpSuccessState(authResponse));
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
      throw e;
    }
  }

  Future<void> updateUser(
      {required String userId,
      required String name,
      required String email,
      required String password,
      required String dateOfBirth,
      required String? favoriteDoctors}) async {
    emit(UpdateUserLoadingState());
    try {
      final authResponse = await _authRepository.updateUser(
          userId: userId,
          name: name,
          email: email,
          password: password,
          dateOfBirth: dateOfBirth,
          favoriteDoctors: favoriteDoctors);
      userModel = const UserModel();
      userModel = authResponse;
      print('response: $userModel');
      emit(UpdateUserSuccessState(authResponse));
    } catch (e) {
      emit(UpdateUserErrorState(e.toString()));
      throw e;
    }
  }

  void signOut(BuildContext context) {
    CacheHelper.removeData(
      key: 'user',
    )!.then((value) {
      print('user id removed successfully');
    }).catchError(() {});
    // emit(AuthStates(response: null));
  }
}
