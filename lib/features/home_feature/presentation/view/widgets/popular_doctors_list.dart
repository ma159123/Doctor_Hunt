import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/popular_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      padding: EdgeInsets.only(left: 5.w),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const PopularDoctorsItem(),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: 4),
    );
  }
}

