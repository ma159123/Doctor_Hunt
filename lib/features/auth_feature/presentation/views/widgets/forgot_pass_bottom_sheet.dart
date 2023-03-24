import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/forgot_pass_widget.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/otp_widget.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/reset_password.dart';
import 'package:flutter/material.dart';

void customBottomSheet(
    {required BuildContext context,
    required TextEditingController controller}) {
  final TextEditingController pinController = TextEditingController();
  showModalBottomSheet(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    context: context,
    builder: (BuildContext context) {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: AppConstants.pageController,
        children: [
          ForgotPassWidget(controller: controller),
          OTPWidget(pinController: pinController),
          const ResetPassWidget(),
        ],
      );
    },
  );
}
