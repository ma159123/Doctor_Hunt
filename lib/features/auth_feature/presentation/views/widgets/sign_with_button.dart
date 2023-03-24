import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class SignWithButton extends StatelessWidget {
  const SignWithButton({Key? key, required this.iconName, required this.icon, this.onTap, required this.iconColor}) : super(key: key);

  final String iconName;
  final IconData icon;
  final Color iconColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color:Colors.black,
                spreadRadius:0.1
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(icon,color: iconColor,),
            SizedBox(width: 5.w,),
            Text(iconName,style: TextStyles.titleStyle16.copyWith(fontFamily: 'Rubik',color: ColorManager.grey),),
          ],
        ),
      ),
    );
  }
}
