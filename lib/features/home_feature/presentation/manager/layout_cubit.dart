import 'package:doctor_hunt/features/home_feature/data/models/categories_model/categories_model.dart';
import 'package:doctor_hunt/features/home_feature/data/models/doctor_model/doctor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/doctors_model/doctors_model.dart';
import '../../data/repo/get_categories_repo.dart';
import '../../data/repo/get_doctors_repo.dart';
import '../../data/repo/search_doctors_repo.dart';
import '../view/chat_view.dart';
import '../view/favorite_view.dart';
import '../view/home_view.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  GetDoctorsRepository _doctorsRepository;
  SearchDoctorsRepository _searchDoctorsRepository;
  GetCategoriesRepository _categoriesRepository;
  LayoutCubit(
      {required GetDoctorsRepository doctorsRepository,
      required SearchDoctorsRepository searchDoctorsRepository,
      required GetCategoriesRepository getCategoriesRepository})
      : _doctorsRepository = doctorsRepository,
        _searchDoctorsRepository = searchDoctorsRepository,
        _categoriesRepository = getCategoriesRepository,
        super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> views = const [
    HomeView(),
    FavoriteView(),
    ChatView(),
  ];
  int index = 0;
  void changeBottomNavBar(int index) {
    this.index = index;
    emit(ChangeBottomNav());
  }

  DoctorsModel doctorsModel = const DoctorsModel();

  Future<void> getAllDoctors() async {
    emit(GetAllDoctorsLoadingState());
    final response = await _doctorsRepository.getAllDoctors();
    response.fold((failure) {
      print('get doctors error: $failure');
      emit(GetAllDoctorsErrorState(failure.toString()));
    }, (success) {
      doctorsModel = success;
      print('get doctors success: $doctorsModel');
      emit(GetAllDoctorsSuccessState(success));
    });
  }

  DoctorModel doctorModel=DoctorModel();
  Future<void> getDoctorsByID({required String id}) async {
    emit(GetDoctorsByIdLoadingState());
    final response = await _doctorsRepository.getDoctorsById(id: id);
    response.fold((failure) {
      print('get doctors by id error: $failure');
      emit(GetDoctorsByIdErrorState(failure.toString()));
    }, (success) {
      doctorModel = success;
      print('get doctors by id success: $doctorsModel');
      emit(GetDoctorsByIdSuccessState(success));
    });
  }

  Future<void> getFavoritesDoctors({required String ids})async {

  }

  DoctorsModel specificDoctorsModel = const DoctorsModel();

  Future<void> getDoctorsByCategory({required String? categoryId}) async {
    specificDoctorsModel = const DoctorsModel();
    emit(GetDoctorsByCategoryLoadingState());
    final response =
        await _doctorsRepository.getDoctorsByCategories(categoryId: categoryId);
    response.fold((failure) {
      print('get doctors error: $failure');
      emit(GetDoctorsByCategoryErrorState(failure.toString()));
    }, (success) {
      specificDoctorsModel = success;
      print('get doctors success: $doctorsModel');
      emit(GetDoctorsByCategorySuccessState(success));
    });
  }

  DoctorsModel searchDoctorsModel = const DoctorsModel();
  Future<void> searchDoctors({String? name}) async {
    emit(SearchDoctorsLoadingState());
    final response = await _searchDoctorsRepository.searchDoctors(name: name);
    response.fold((failure) {
      print('Search doctors error: $failure');
      emit(SearchDoctorsErrorState(failure.toString()));
    }, (success) {
      searchDoctorsModel = success;
      print('Search doctors success: $searchDoctorsModel');
      emit(SearchDoctorsSuccessState(success));
    });
  }

  void clearSearchResults() {
    searchDoctorsModel = const DoctorsModel();
    emit(ClearSearchDoctorsSuccessState());
  }

  CategoriesModel categoriesModel = const CategoriesModel();
  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    final response = await _categoriesRepository.getAllCategories();
    response.fold((failure) {
      print('get categories error: $failure');
      emit(GetAllCategoriesErrorState(failure.toString()));
    }, (success) {
      categoriesModel = success;
      print('get categories success: $categoriesModel');
      emit(GetAllCategoriesSuccessState(success));
    });
  }
}
