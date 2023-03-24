import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SearchDoctorsList extends StatelessWidget {
  const SearchDoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      padding: EdgeInsets.only(left: 5.w,right: 5.w),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const SearchDoctorsItem(),
          separatorBuilder: (context, index) => SizedBox(
            width: 5.w,
          ),
          itemCount: 4),
    );
  }
}
