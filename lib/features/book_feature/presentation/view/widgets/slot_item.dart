import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SlotItem extends StatelessWidget {
  const SlotItem(
      {Key? key,
      required this.time,
      this.onTap,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  final String time;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: 25.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: Center(
            child: Text(
          time,
          style: TextStyles.titleStyle14.copyWith(color: textColor),
        )),
      ),
    );
  }
}
