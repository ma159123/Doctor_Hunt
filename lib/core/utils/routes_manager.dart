import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_patient/user_model_as_patient.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/register_view.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_patient_appointments/doctor.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/add_record_view.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/book_view.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/medical_records_view.dart';
import 'package:doctor_hunt/features/on_boarding/on_boarding_view.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/doctor_details.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/home_view.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/popular_doctors_view.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/profile_view.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

import '../../features/doctor_home_feature/presentation/view/layout.dart';
import '../../features/splash/splash_view.dart';

class AppRoutes {
  static const String splashViewRoute = '/';
  static const String layoutViewRoute = '/layoutView';
  static const String homeViewRoute = '/homeView';
  static const String bookDetailsViewRoute = '/bookDetailsView';
  static const String searchViewRoute = '/searchView';
  static const String loginViewRoute = '/loginView';
  static const String registerViewRoute = '/registerView';
  static const String onBoardingViewRoute = '/onBoardingView';
  static const String popularDoctorsViewRoute = '/popularDoctorsView';
  static const String doctorDetailsViewRoute = '/doctorDetailsView';
  static const String medicalRecordsViewRoute = '/medicalRecordsView';
  static const String addRecordViewRoute = '/addRecordView';
  static const String allRecordsViewRoute = '/allRecordsView';
  static const String profileViewRoute = '/profileView';
  static const String specializationViewRoute = '/specializationView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splashViewRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case AppRoutes.layoutViewRoute:
        return MaterialPageRoute(builder: (_) => const LayoutView());

      case AppRoutes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case AppRoutes.bookDetailsViewRoute:
        return MaterialPageRoute(
            builder: (_) => BookView(doctor: args as Result));

      case AppRoutes.searchViewRoute:
        return MaterialPageRoute(builder: (_) => const SearchView());

      case AppRoutes.loginViewRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case AppRoutes.registerViewRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case AppRoutes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case AppRoutes.popularDoctorsViewRoute:
        return MaterialPageRoute(builder: (_) => const PopularDoctorsView());

      case AppRoutes.doctorDetailsViewRoute:
        return MaterialPageRoute(
            builder: (_) => DoctorDetailsView(doctor: args as Result));

      case AppRoutes.medicalRecordsViewRoute:
        return MaterialPageRoute(builder: (_) => const MedicalRecordsView());

      case AppRoutes.addRecordViewRoute:
        return MaterialPageRoute(builder: (_) => const AddRecordView());

      case AppRoutes.profileViewRoute:
        return MaterialPageRoute(
            builder: (_) =>
                PatientProfileView(userModel: args as UserModelAsPatient));

      default:
        return MaterialPageRoute(builder: (_) => noRoute());
    }
  }
}

Widget noRoute() {
  return Scaffold(
    appBar: AppBar(),
    body: const Center(
      child: Text('Sorry, the page you are looking for cannot be found.'),
    ),
  );
}
