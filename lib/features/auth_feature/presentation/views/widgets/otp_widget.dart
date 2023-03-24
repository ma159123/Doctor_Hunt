import 'package:doctor_hunt/features/auth_feature/presentation/views/widgets/pin_code.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/line_widget.dart';
import '../../../../../core/widgets/custom_button.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({Key? key, required this.pinController}) : super(key: key);
  final TextEditingController pinController;

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
      height: 50.h,
      child: Column(
        children: [
          LineWidget(
            color: ColorManager.lightGrey,
          ),
          SizedBox(
            height: 6.h,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter 4 Digits Code',
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
                    'Enter the 4 digits code that you received on your email.',
                    style: TextStyles.titleStyle14
                        .copyWith(color: ColorManager.grey),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: PinCodeWidget(
                    pinController: widget.pinController,
                    onComplete: null,
                    isTrueCode: true,
                  ),
                ),
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
          ),
        ],
      ),
    );
  }
}
