import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/doctors_categories_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class DoctorCategoriesList extends StatelessWidget {
  const DoctorCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      padding: EdgeInsets.only(right: 5.w),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const DoctorCategoriesItem(),
          separatorBuilder: (context, index) => SizedBox(
            width: 5.w,
          ),
          itemCount: 4),
    );
  }
}
