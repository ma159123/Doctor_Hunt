import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/app_text_field.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/sign_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  String type = 'patient';
  bool _isPatientSelected = true;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is SignUpDoctorsErrorState) {
          showSnackBar(
              context: context,
              msg: state.error,
              backgroundColor: ColorManager.error);
        } else if (state is SignUpDoctorsSuccessState) {
          showSnackBar(
              context: context,
              msg: state.userModel.message!,
              backgroundColor: ColorManager.green);
          Navigator.pushNamed(context,AppRoutes.loginViewRoute);
        }
        if (state is SignUpPatientErrorState) {
          showSnackBar(
              context: context,
              msg: state.error,
              backgroundColor: ColorManager.error);
        } else if (state is SignUpPatientSuccessState) {
          showSnackBar(
              context: context,
              msg: state.userModel.message!,
              backgroundColor: ColorManager.green);
          Navigator.pushNamed(context,AppRoutes.loginViewRoute);
        }
      }, builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            height: 100.h,
            padding: EdgeInsets.only(top: 15.h, right: 5.w, left: 5.w),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: Svg(
                    'assets/images/background.svg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Join now and start booking',
                    style:
                        TextStyles.titleStyle25.copyWith(fontFamily: 'Rubik'),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'You can easily book appointments with your preferred doctors',
                    style: TextStyles.titleStyle14.copyWith(
                        fontFamily: 'Rubik', color: ColorManager.grey),
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
                    textEditingController: nameController,
                    hintText: 'Name',
                    validation: (val) {},
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppTextField(
                    textEditingController: emailController,
                    hintText: 'Email',
                    validation: (val) {},
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppTextField(
                    textEditingController: passController,
                    hintText: 'Password',
                    validation: (val) {},
                    obscureText: authCubit.isSecurePass,
                    suffixIcon: IconButton(
                      onPressed: () {
                        authCubit.showPassword();
                      },
                      icon: Icon(
                        authCubit.isSecurePass == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
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
                    height: 5.h,
                  ),
                  state is SignUpDoctorsLoadingState ||
                          state is SignUpPatientLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                          color: ColorManager.green,
                        ))
                      : CustomButton(
                          buttonText: 'Sign up',
                          textColor: Colors.white,
                          color: ColorManager.green,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (type == 'patient') {
                                await context
                                    .read<AuthCubit>()
                                    .registerForPatient(
                                      nameController.text,
                                      emailController.text,
                                      passController.text,
                                      type,
                                    );
                              } else {
                                await context
                                    .read<AuthCubit>()
                                    .registerForDoctors(
                                      nameController.text,
                                      emailController.text,
                                      passController.text,
                                      type,
                                    );
                              }
                            }
                          },
                        ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,AppRoutes.loginViewRoute);
                    },
                    child: Text(
                      'Have an account? Log in',
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
      }),
    );
  }
}
