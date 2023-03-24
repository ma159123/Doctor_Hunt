import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();
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
            const Text('Doctor Hunt',style: TextStyles.titleStyle25,),
          ],
        ),
      ),
    );
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      GoRouter.of(context).push(AppRoutes.onBoardingViewRoute);
    });
  }
}
