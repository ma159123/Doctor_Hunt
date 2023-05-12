import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/add_record_text_field.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/medical_specialties_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/popular_doctors_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth_feature/presentation/views/login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
                height: 40.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ColorManager.darkGreen, ColorManager.lightGreen],
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAppBar(
                          title: 'All Records',
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          textColor: ColorManager.white,
                          bottomColor: ColorManager.white,
                          iconColor: Colors.black,
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Confirm Logout'),
                                      content: Text(
                                          'Are you sure you want to log out?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: ColorManager.green),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(
                                                color: ColorManager.green),
                                          ),
                                          onPressed: () {
                                            authCubit.signOut(context);
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginView()),
                                                (Route<dynamic> route) =>
                                                    false
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.logout_outlined,
                              color: ColorManager.white,
                              size: 30,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Set up your profile',
                      style: TextStyles.titleStyle18.copyWith(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Update your profile to connect your doctor with better impression.',
                        textAlign: TextAlign.center,
                        style: TextStyles.titleStyle16
                            .copyWith(color: ColorManager.white),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Personal information',
                  style: TextStyles.titleStyle18,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AddRecordTextField(
                hintText: 'Enter patient name',
                suffixIcon: const Icon(Icons.edit),
                title: 'Name',
              ),
              AddRecordTextField(
                hintText: '+201024380419',
                suffixIcon: const Icon(Icons.edit),
                title: 'Contact Number',
              ),
              AddRecordTextField(
                hintText: 'Enter Date of birth',
                suffixIcon: const Icon(Icons.edit),
                title: 'Date of birth',
              ),
              AddRecordTextField(
                hintText: 'Add Details',
                suffixIcon: const Icon(Icons.edit),
                title: 'Location',
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                width: 70.w,
                onTap: () {
                  authCubit.updateUser(
                      userId: authCubit.userModel!.results![0].id!,
                      name: 'Mohamed',
                      email: authCubit.userModel!.results![0].email!,
                      password: authCubit.userModel!.results![0].password!,
                      dateOfBirth: '1990-01-01',
                      favoriteDoctors: "644b136539f43985aa7536e7");
                },
                buttonText: 'Continue',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
