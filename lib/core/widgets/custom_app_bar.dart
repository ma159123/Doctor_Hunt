import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title,required this.onTap}) : super(key: key);

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
      onTap:onTap,
          child: Container(
            height: 5.h,
            width: 10.w,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),

            ),
            child:  Center(child: Icon(Icons.arrow_back_ios_new_rounded,color:ColorManager.grey ,)),
          ),
        ),
        SizedBox(width: 5.w,),
        Text(title,style: TextStyles.titleStyle18.copyWith(fontWeight: FontWeight.w400),)
      ],
    );
  }
}
