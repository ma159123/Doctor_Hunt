import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/line_widget.dart';
import 'app_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';

class ResetPassWidget extends StatefulWidget {
  const ResetPassWidget({Key? key}) : super(key: key);

  @override
  State<ResetPassWidget> createState() => _ResetPassWidgetState();
}

class _ResetPassWidgetState extends State<ResetPassWidget> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController resetPassController = TextEditingController();

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
            'Reset Password',
            textAlign: TextAlign.start,
            style: TextStyles.titleStyle25,
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              'Set the new password for your account so you can login and access all the features.',
              style: TextStyles.titleStyle14.copyWith(color: ColorManager.grey),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          AppTextField(
            textEditingController: newPassController,
            hintText: 'New Password',
            validation: (val) {},
            isPass: true,
            suffixIcon: const Icon(
              Icons.remove_red_eye,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          AppTextField(
            textEditingController: resetPassController,
            hintText: 'Re-enter Password',
            validation: (val) {},
            isPass: true,
            suffixIcon: const Icon(
              Icons.remove_red_eye,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomButton(
            buttonText: 'Continue',
            textColor: Colors.white,
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            width: 80.w,
          )
        ],
      ),
    );
  }
}
