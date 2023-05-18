import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/auth_feature/data/models/user_model_as_doctor/user_model.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth_feature/presentation/views/login_view.dart';
import '../../../book_feature/presentation/view/widgets/add_record_text_field.dart';

class DoctorProfileView extends StatefulWidget {
  const DoctorProfileView({Key? key, required this.userModel})
      : super(key: key);

  final UserModelAsDoctor userModel;

  @override
  State<DoctorProfileView> createState() => _DoctorProfileViewState();
}

class _DoctorProfileViewState extends State<DoctorProfileView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.userModel.results?[0].name ?? '';
    emailController.text = widget.userModel.results?[0].email ?? '';
  }

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
                          title: 'Profile',
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
                                      title: const Text('Confirm Logout'),
                                      content: const Text(
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
                                                    false);
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
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(widget
                              .userModel.results?[0].image ??
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
                controller: nameController..text,
              ),
              AddRecordTextField(
                hintText: 'Enter email',
                suffixIcon: const Icon(Icons.edit),
                title: 'Email',
                controller: emailController..text,
              ),
              AddRecordTextField(
                hintText: 'Enter Date of birth',
                suffixIcon: const Icon(Icons.edit),
                title: 'Date of birth',
                controller: dateController..text,
              ),
              AddRecordTextField(
                hintText: 'Add Details',
                suffixIcon: const Icon(Icons.edit),
                title: 'Location',
                controller: locationController,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                width: 70.w,
                onTap: () {
                  authCubit.updatePatient(
                      userId: authCubit.userModelAsDoctor!.results![0].id!,
                      name: nameController.text,
                      email: authCubit.userModelAsDoctor!.results![0].email!,
                      password:
                          authCubit.userModelAsDoctor!.results![0].password!,
                      dateOfBirth: dateController.text,
                      favoriteDoctors: []);
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
