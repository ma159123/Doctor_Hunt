import 'dart:async';
import 'dart:convert';

import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/auth_feature/data/models/user_model/user_model.dart';
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

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detectInitialPage();
    // navigateToLogin();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash_icon.png'),
            SizedBox(
              height: 1.h,
            ),
            const Text(
              'Doctor Hunt',
              style: TextStyles.titleStyle25,
            ),
          ],
        ),
      ),
    );
  }

  // void navigateToLogin() {
  //   Future.delayed(const Duration(seconds: 2)).then((value) {
  //     GoRouter.of(context).push(AppRoutes.onBoardingViewRoute);
  //   });
  // }

  Future<void> detectInitialPage() async {
    String widget;
    final userJson = CacheHelper.getData(key: 'user') ?? '';
    if (userJson != '') {
      AuthCubit.get(context).userModel =
          UserModel.fromJson(jsonDecode(userJson));
    }

    if (AuthCubit.get(context).userModel?.results?[0].id != null) {
      print(AuthCubit.get(context).userModel?.results?[0].id);

      widget = AppRoutes.homeViewRoute;
    } else {
      widget = AppRoutes.onBoardingViewRoute;
      print(widget);
    }
    Timer(const Duration(seconds: 2), () {
      GoRouter.of(context).push(widget);
    });
  }
}
