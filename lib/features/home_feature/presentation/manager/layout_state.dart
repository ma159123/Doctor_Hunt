import 'package:doctor_hunt/features/home_feature/data/models/categories_model/categories_model.dart';

import '../../data/models/doctors_model/doctors_model.dart';

abstract class LayoutState {}

class InitialLayoutState extends LayoutState {}

class ChangeBottomNav extends LayoutState {}

class GetAllDoctorsLoadingState extends LayoutState {}

class GetAllDoctorsSuccessState extends LayoutState {
  DoctorsModel doctorsModel;
  GetAllDoctorsSuccessState(this.doctorsModel);
}

class GetAllDoctorsErrorState extends LayoutState {
  String error;
  GetAllDoctorsErrorState(this.error);
}

class SearchDoctorsLoadingState extends LayoutState {}

class SearchDoctorsSuccessState extends LayoutState {
  DoctorsModel doctorsModel;
  SearchDoctorsSuccessState(this.doctorsModel);
}

class SearchDoctorsErrorState extends LayoutState {
  String error;
  SearchDoctorsErrorState(this.error);
}

class ClearSearchDoctorsSuccessState extends LayoutState {}


class GetAllCategoriesLoadingState extends LayoutState {}

class GetAllCategoriesSuccessState extends LayoutState {
  CategoriesModel categoriesModel;
  GetAllCategoriesSuccessState(this.categoriesModel);
}

class GetAllCategoriesErrorState extends LayoutState {
  String error;
  GetAllCategoriesErrorState(this.error);
}
