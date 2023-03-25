import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class SearchDoctorsList extends StatelessWidget {
  const SearchDoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
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
