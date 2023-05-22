import 'dart:async';
import 'dart:convert';

import 'package:doctor_hunt/core/utils/routes_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_doctor/user_model.dart';
import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_patient/user_model_as_patient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../core/local/cache.dart';
import '../../core/utils/app_routes.dart';
import '../auth_feature/presentation/manager/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detectInitialPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app-icon.png'),
            SizedBox(
              height: 1.h,
            ),
            const Text(
              'Roshetta',
              style: TextStyles.titleStyle25,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> detectInitialPage() async {
    String widget;
    final doctorJson = CacheHelper.getData(key: 'doctor') ?? '';
    final patientJson = CacheHelper.getData(key: 'patient') ?? '';
    if (doctorJson != '') {
      AuthCubit.get(context).userModelAsDoctor =
          UserModelAsDoctor.fromJson(jsonDecode(doctorJson));
    }

    if (patientJson != '') {
      AuthCubit.get(context).userModelAsPatient =
          UserModelAsPatient.fromJson(jsonDecode(patientJson));
    }

    if (AuthCubit.get(context).userModelAsDoctor?.results?[0].id != null) {
      print(AuthCubit.get(context).userModelAsDoctor?.results?[0].id);

      widget = AppRoutes.layoutViewRoute;
    } else if (AuthCubit.get(context).userModelAsPatient?.result?.id != null) {
      print(AuthCubit.get(context).userModelAsPatient?.result?.id);

      widget = AppRoutes.layoutViewRoute;
    } else {
      widget = AppRoutes.onBoardingViewRoute;
      print(widget);
    }
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, widget);
    });
  }
}
