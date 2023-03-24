import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  var validation;
  var onChange;
  bool? isValidation;
  String? validationText;
  bool isMaxLine = false;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? width;
  double? radius;
  var onTap;
  SearchTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.isMaxLine = false,
      required this.validation,
      this.isValidation,
      this.validationText,
      this.prefixIcon,
      this.width,
      this.radius,
      this.suffixIcon,
      this.onChange,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          width: width ?? 90.w,
          child: TextFormField(
            onTap: onTap ?? () {},
            autofocus: false,
            cursorColor: Colors.black,
            validator: validation ?? () {},
            onChanged: onChange ?? (v) {},
            keyboardType: TextInputType.emailAddress,
            maxLines: isMaxLine ? 2 : 1,
            controller: textEditingController,
            scrollPadding: EdgeInsets.only(bottom: 40.h),
            style: TextStyle(
              color: ColorManager.grey,
              // fontSize: 10.sp,
            ),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              fillColor: ColorManager.white,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              isDense: true,
              hintText: hintText,
              hintStyle: TextStyles.titleStyle16.copyWith(
                  fontWeight: FontWeight.w300,
                  color: ColorManager.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 12.0),
                borderSide: BorderSide(
                  color: ColorManager.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 12.0),
                borderSide: BorderSide(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ),
        // SizedBox(height: 0.3.h,),
        isValidation == true
            ? Padding(
                padding: EdgeInsets.only(right: 25.w),
                child: Text(
                  validationText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
