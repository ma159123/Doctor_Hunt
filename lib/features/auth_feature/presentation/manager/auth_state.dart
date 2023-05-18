import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_patient/user_model_as_patient.dart';

import '../../data/models/user_model_as_doctor/user_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangePassAppearanceSuccessState extends AuthStates {}

class SignInDoctorsLoadingState extends AuthStates {}

class SignInDoctorsErrorState extends AuthStates {
  String error;
  SignInDoctorsErrorState(this.error);
}

class SignInDoctorsSuccessState extends AuthStates {
  UserModelAsDoctor userModel;
  SignInDoctorsSuccessState(this.userModel);
}

class SignInPatientLoadingState extends AuthStates {}

class SignInPatientErrorState extends AuthStates {
  String error;
  SignInPatientErrorState(this.error);
}

class SignInPatientSuccessState extends AuthStates {
  UserModelAsPatient userModel;
  SignInPatientSuccessState(this.userModel);
}

class SignUpDoctorsLoadingState extends AuthStates {}

class SignUpDoctorsErrorState extends AuthStates {
  String error;
  SignUpDoctorsErrorState(this.error);
}

class SignUpDoctorsSuccessState extends AuthStates {
  UserModelAsDoctor userModel;
  SignUpDoctorsSuccessState(this.userModel);
}

class SignUpPatientLoadingState extends AuthStates {}

class SignUpPatientErrorState extends AuthStates {
  String error;
  SignUpPatientErrorState(this.error);
}

class SignUpPatientSuccessState extends AuthStates {
  UserModelAsPatient userModel;
  SignUpPatientSuccessState(this.userModel);
}

class UpdateUserLoadingState extends AuthStates {}

class UpdateUserErrorState extends AuthStates {
  String error;
  UpdateUserErrorState(this.error);
}

class UpdateUserSuccessState extends AuthStates {
  UserModelAsPatient userModel;
  UpdateUserSuccessState(this.userModel);
}

class ChangeFavoriteLoadingState extends AuthStates {}

class ChangeFavoriteErrorState extends AuthStates {
  String error;
  ChangeFavoriteErrorState(this.error);
}

class ChangeFavoriteSuccessState extends AuthStates {
  UserModelAsPatient userModel;
  ChangeFavoriteSuccessState(this.userModel);
}
