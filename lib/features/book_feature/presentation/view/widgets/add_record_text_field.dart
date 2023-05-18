import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class AddRecordTextField extends StatelessWidget {
  AddRecordTextField(
      {Key? key,
      required this.hintText,
      required this.title,
      this.validation,
      this.onTap,
      this.suffixIcon,
      this.isValidation,
      this.validationText,
      required this.controller})
      : super(key: key);
  final String hintText;
  final String? Function(String?)? validation;
  final TextEditingController controller;
  bool? isValidation;
  String title;
  String? validationText;
  Widget? suffixIcon;
  var onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 12.h,
        width: 100.w,
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyles.titleStyle16,
              ),
            ),
            SizedBox(
              width: 95.w,
              child: TextFormField(
                controller: controller,
                cursorColor: ColorManager.grey,
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: TextStyles.titleStyle14,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                validator: validation,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
