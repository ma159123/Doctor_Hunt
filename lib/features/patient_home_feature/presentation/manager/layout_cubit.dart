import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/categories_model/categories_model.dart';
import '../../data/models/doctor_model/doctor_model.dart';
import '../../data/models/doctors_model/doctors_model.dart';
import '../../data/repo/get_categories_repo.dart';
import '../../data/repo/get_doctors_repo.dart';
import '../../data/repo/search_doctors_repo.dart';
import '../view/appointments_view.dart';
import '../view/favorite_view.dart';
import '../view/home_view.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  final GetDoctorsRepository _doctorsRepository;
  final SearchDoctorsRepository _searchDoctorsRepository;
  final GetCategoriesRepository _categoriesRepository;
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
    AppointmentsView(),
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

  DoctorModel doctorModel = const DoctorModel();
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

  List<DoctorModel> favoriteDoctorsList = [];
  Future<void> getFavoritesDoctors({required List<dynamic>? ids}) async {
    favoriteDoctorsList = [];
    emit(GetFavoriteDoctorsLoadingState());
    if (ids?.length != 0) {
      for (var id in ids!) {
        await getDoctorsByID(id: id);
        favoriteDoctorsList.add(doctorModel);
      }
    }
    emit(GetFavoriteDoctorsSuccessState());
    print("favoriteDoctorsList:$favoriteDoctorsList");
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
      print('get doctors success: $specificDoctorsModel');
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
    print(
        'get categories loading...................................................');
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
