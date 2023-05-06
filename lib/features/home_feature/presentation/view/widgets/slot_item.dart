import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SlotItem extends StatelessWidget {
  const SlotItem({Key? key, required this.isSelected}) : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        '1:00 PM',
        style: TextStyles.titleStyle14.copyWith(
            color: isSelected ? ColorManager.white : ColorManager.green),
      )),
    );
  }
}
