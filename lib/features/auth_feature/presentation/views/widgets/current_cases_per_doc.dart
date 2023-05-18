import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';

class CurrentDoctorCases extends StatelessWidget {
  const CurrentDoctorCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 15.h,
        width: 85.w,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGrey,
              blurRadius: 2,
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentCase(title: 'Running', num: 100),
            SizedBox(
              width: 5.w,
            ),
            currentCase(title: 'Ongoing', num: 600),
            SizedBox(
              width: 5.w,
            ),
            currentCase(title: 'Patient', num: 700),
          ],
        ),
      ),
    );
  }

  Widget currentCase({required String title, required int num}) {
    return Container(
      height: 12.h,
      width: 22.w,
      decoration: BoxDecoration(
        color: ColorManager.lightGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.titleStyle18,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            '$num',
            style:
                TextStyles.titleStyle14.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
