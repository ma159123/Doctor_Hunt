import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/line_widget.dart';
import 'app_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';

class ForgotPassWidget extends StatefulWidget {
  const ForgotPassWidget({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<ForgotPassWidget> createState() => _ForgotPassWidgetState();
}

class _ForgotPassWidgetState extends State<ForgotPassWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineWidget(
            color: ColorManager.lightGrey,
          ),
          SizedBox(
            height: 6.h,
          ),
          const Text(
            'Forgot password',
            textAlign: TextAlign.start,
            style: TextStyles.titleStyle25,
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              'Enter your email for the verification proccesss,we will send 4 digits code to your email.',
              style: TextStyles.titleStyle14.copyWith(color: ColorManager.grey),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          AppTextField(
              textEditingController: widget.controller,
              hintText: 'Email',
              validation: (val) {},
              isPass: false),
          SizedBox(
            height: 3.h,
          ),
          CustomButton(
            buttonText: 'Continue',
            textColor: Colors.white,
            onTap: () {
              setState(() {
                AppConstants.pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              });
            },
            width: 80.w,
          )
        ],
      ),
    );
  }
}
