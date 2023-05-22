import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/repo/get_categories_repo.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/repo/get_doctors_repo.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/repo/search_doctors_repo.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/local/cache.dart';
import 'core/utils/routes_manager.dart';
import 'features/auth_feature/data/repo/authentication_repository.dart';
import 'features/book_feature/data/repo/appointment_repo.dart';
import 'features/book_feature/presentation/manager/book_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            Provider(
              create: (_) =>
                  AuthCubit(authRepository: AuthenticationRepository()),
            ),
            Provider(
              create: (BuildContext context) =>
                  BookCubit(appointmentRepository: AppointmentRepository()),
            ),
            Provider(
              create: (_) => LayoutCubit(
                  doctorsRepository: GetDoctorsRepository(),
                  searchDoctorsRepository: SearchDoctorsRepository(),
                  getCategoriesRepository: GetCategoriesRepository())
                ..getAllDoctors()
                ..getAllCategories(),
            ),
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: 'Doctor Hunt',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.getRoute,
          ),
        );
      },
    );
  }
}
