import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../data/models/doctor_model/doctor_model.dart';
import 'favorite_doctors_item.dart';

class FavoriteDoctorsList extends StatelessWidget {
  const FavoriteDoctorsList({Key? key, required this.doctors})
      : super(key: key);
  final List<DoctorModel> doctors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,AppRoutes.doctorDetailsViewRoute,
                    arguments: doctors[index],
                  );
                },
                child: FavoriteDoctorsItem(
                  doctor: doctors[index].result!,
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: doctors.length ?? 0),
    );
  }
}
