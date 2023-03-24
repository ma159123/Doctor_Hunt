import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/app_text_field.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/forgot_pass_bottom_sheet.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/sign_with_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/text_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passController=TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(top: 20.h, right: 5.w, left: 5.w),
        // decoration:  BoxDecoration(
        //   // gradient: LinearGradient(
        //   //     colors: [ColorManager.green,Colors.white, ColorManager.green],
        //   //     begin: FractionalOffset(0.0, 0.0),
        //   //     end: FractionalOffset(0.5, 0.3),
        //   //     stops: [0.0,1.0, 0.0],
        //   //     tileMode: TileMode.clamp
        //   // ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Welcome back',
                style: TextStyles.titleStyle25,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'You can search course, apply course and find scholarship for abroad studies',
                style: TextStyles.titleStyle14
                    .copyWith( color: ColorManager.grey),
              ),
              SizedBox(
                height: 5.h,
              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  SignWithButton(iconName: 'Google', icon: FontAwesomeIcons.google,onTap:(){}, iconColor: Colors.black ,),
                  SignWithButton(iconName: 'Facebook', icon: FontAwesomeIcons.facebook,onTap: (){}, iconColor: Colors.blueAccent,),
                ],
              ),
            ),
              SizedBox(
                height: 3.h,
              ),
              AppTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  validation: (val){},
                  isPass: false),
              SizedBox(
                height: 2.h,
              ),
              AppTextField(
                  textEditingController: passController,
                  hintText: 'Password',
                  validation: (val){},
                  isPass: true,
              suffixIcon: const Icon(Icons.remove_red_eye,),
              ),
              SizedBox(height: 4.h,),
               CustomButton(buttonText: 'Login', textColor: Colors.white,color: ColorManager.green,onTap: (){
                 GoRouter.of(context).push(AppRoutes.layoutViewRoute);
               },),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){
                  customBottomSheet( context: context, controller: emailController);
                },
                child: Text(
                  'Forgot password',
                  style: TextStyles.titleStyle16.copyWith(color: ColorManager.green,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(AppRoutes.registerViewRoute);
                },
                child: Text(
                  'Don’t have an account? Join us',
                  style: TextStyles.titleStyle16.copyWith(color: ColorManager.green,fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
