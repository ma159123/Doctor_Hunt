import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void signOut() {
    // emit(AuthStates(response: null));
  }
}
