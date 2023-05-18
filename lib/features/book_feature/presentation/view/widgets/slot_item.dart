import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SlotItem extends StatelessWidget {
  const SlotItem({Key? key, required this.isSelected, required this.time, this.onTap}) : super(key: key);
  final bool isSelected;
  final String time;
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
          color: isSelected
              ? ColorManager.green
              : ColorManager.green.withOpacity(0.1),
        ),
        child: Center(
            child: Text(
          time,
          style: TextStyles.titleStyle14.copyWith(
              color: isSelected ? ColorManager.white : ColorManager.green),
        )),
      ),
    );
  }
}
