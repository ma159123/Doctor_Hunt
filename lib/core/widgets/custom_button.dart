import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  final double?height;
  final double?width;
  final double? fontSize;
  final double radius;
  final Color ?color;
  final FontWeight ? fontWeight;
  final Color textColor;

  const CustomButton({Key? key,
    this.onTap,
    required this.buttonText,
    this.width,
    this.height,
    this.fontSize,
    this.radius=10,
    required this.textColor,
     this.color,
    this.fontWeight,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
             border: Border.all(color: ColorManager.green),
            color: color??ColorManager.green,
          ),

          width: width??  85.w,
          height: height??8.h,
          child: Center(
              child: Text(buttonText,style:TextStyles.titleStyle18.copyWith(color: textColor,fontSize: fontSize??18),
              )
          ),
        ),
      ),
    );
  }
}
