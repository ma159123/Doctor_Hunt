import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'feature_doctors_item.dart';

class FeatureDoctorsList extends StatelessWidget {
  const FeatureDoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      padding: EdgeInsets.only(left: 5.w),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const FeatureDoctorsItem(),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: 4),
    );
  }
}
