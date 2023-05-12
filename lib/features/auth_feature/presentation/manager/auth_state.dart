import '../../data/models/user_model/user_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class SignInLoadingState extends AuthStates {}

class SignInErrorState extends AuthStates {
  String error;
  SignInErrorState(this.error);
}

class SignInSuccessState extends AuthStates {
  UserModel userModel;
  SignInSuccessState(this.userModel);
}

class SignUpLoadingState extends AuthStates {}

class SignUpErrorState extends AuthStates {
  String error;
  SignUpErrorState(this.error);
}

class SignUpSuccessState extends AuthStates {
  UserModel userModel;
  SignUpSuccessState(this.userModel);
}

class UpdateUserLoadingState extends AuthStates {}

class UpdateUserErrorState extends AuthStates {
  String error;
  UpdateUserErrorState(this.error);
}

class UpdateUserSuccessState extends AuthStates {
  UserModel userModel;
  UpdateUserSuccessState(this.userModel);
}
