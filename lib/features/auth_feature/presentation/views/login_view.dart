import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/app_text_field.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/forgot_pass_bottom_sheet.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/sign_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/text_styles.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    String type = 'patient';
    bool _isPatientSelected = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SignInErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextStyle(color: ColorManager.white),
                ),
                backgroundColor: ColorManager.error,
              ),
            );
          } else if (state is SignInSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.userModel.message!,
                  style: TextStyle(color: ColorManager.white),
                ),
                backgroundColor: ColorManager.green,
              ),
            );
            GoRouter.of(context).push(AppRoutes.layoutViewRoute);
          }
        },
        builder: (context, state) {
          return Container(
            height: 100.h,
            padding: EdgeInsets.only(top: 20.h, right: 5.w, left: 5.w),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: Svg(
                    'assets/images/background.svg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                          .copyWith(color: ColorManager.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SignWithButton(
                            iconName: 'Google',
                            icon: FontAwesomeIcons.google,
                            onTap: () {},
                            iconColor: Colors.black,
                          ),
                          SignWithButton(
                            iconName: 'Facebook',
                            icon: FontAwesomeIcons.facebook,
                            onTap: () {},
                            iconColor: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    AppTextField(
                        textEditingController: emailController,
                        hintText: 'Email',
                        validation: (val) {},
                        isPass: false),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppTextField(
                      textEditingController: passController,
                      hintText: 'Password',
                      validation: (val) {},
                      isPass: true,
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _isPatientSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isPatientSelected = value!;
                                  type = 'patient';
                                });
                              },
                            ),
                            const Text('Patient'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: !_isPatientSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isPatientSelected = !value!;
                                  type = 'doctor';
                                });
                              },
                            ),
                            const Text('Doctor'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    state is SignInLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                            color: ColorManager.green,
                          ))
                        : CustomButton(
                            buttonText: 'Login',
                            textColor: Colors.white,
                            color: ColorManager.green,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AuthCubit>()
                                    .signInWithEmailAndPassword(
                                      emailController.text,
                                      passController.text,
                                      type,
                                    );
                              }
                            },
                          ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        customBottomSheet(
                            context: context, controller: emailController);
                      },
                      child: Text(
                        'Forgot password',
                        style: TextStyles.titleStyle16.copyWith(
                            color: ColorManager.green,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.registerViewRoute);
                      },
                      child: Text(
                        'Don’t have an account? Join us',
                        style: TextStyles.titleStyle16.copyWith(
                            color: ColorManager.green,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
