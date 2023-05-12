import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/popular_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../data/models/doctors_model/doctors_model.dart';

class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({Key? key, required this.doctors}) : super(key: key);

  final DoctorsModel doctors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRoutes.doctorDetailsViewRoute,
                    extra: doctors.results![index],
                  );
                },
                child: PopularDoctorsItem(
                  doctor: doctors.results![index],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: doctors.results?.length ?? 0),
    );
  }
}
