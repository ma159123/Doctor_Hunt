import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class PinCodeWidget extends StatefulWidget {
  TextEditingController pinController;
  var onComplete;
  bool isTrueCode;
  PinCodeWidget(
      {Key? key,
      required this.pinController,
      required this.onComplete,
      required this.isTrueCode})
      : super(key: key);

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      errorTextMargin: const EdgeInsets.only(top: 20),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: ColorManager.lightGrey.withOpacity(0.2),
        inactiveColor: ColorManager.lightGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        //  errorBorderColor: AppColors.red,
        selectedColor: ColorManager.grey,
        fieldWidth: 13.w,
      ),
      controller: widget.pinController,
      textStyle: TextStyle(
        color: ColorManager.green,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      autoFocus: false,
      hintStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
      ),
      hintCharacter: "",
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      showCursor: true,
      cursorColor: ColorManager.lightGrey,
      onChanged: (String value) {
        print(value);
      },
      onCompleted: widget.onComplete,
      validator: (s) {
        return null;
        // return s == '2221' ? null : 'Incorrect code. Please try again.';
      },
    );
  }
}
