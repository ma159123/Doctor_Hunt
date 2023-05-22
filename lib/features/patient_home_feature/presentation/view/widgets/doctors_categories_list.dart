import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/doctors_model.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/doctors_categories_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/routes_manager.dart';

class DoctorCategoriesList extends StatelessWidget {
  const DoctorCategoriesList(
      {Key? key, required this.isScrolled, required this.doctor})
      : super(key: key);
  final DoctorsModel doctor;
  final bool isScrolled;
  @override
  Widget build(BuildContext context) {
    print(doctor.results?.length);
    return SizedBox(
      height: 18.h,
      child: ListView.separated(
          physics: isScrolled
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,AppRoutes.doctorDetailsViewRoute,
                    arguments: doctor.results![index],
                  );
                },
                child: DoctorCategoriesItem(
                  doctor: doctor.results![index],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: doctor.results?.length ?? 0),
    );
  }
}
