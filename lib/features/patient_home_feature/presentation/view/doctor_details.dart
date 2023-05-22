import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/doctor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({Key? key, required this.doctor}) : super(key: key);

  final Result doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                title: 'Doctor Details',
                ),
            SizedBox(height: 5.h),
            DoctorInfoWidget(
              doctor: doctor,
            ),
            //const CurrentDoctorCases(),
            SizedBox(
              height: 2.h,
            ),
            //buildDoctorInfo(title: 'Available time', value: 'from ${doctor.workHours?.from} to ${doctor.workHours?.to}'),
            buildDoctorInfo(title: 'Address', value: doctor.address ?? ''),
            buildDoctorInfo(title: 'Phone', value: doctor.phone ?? ''),
            buildDoctorInfo(title: 'Email', value: doctor.email ?? ''),
            buildDoctorInfo(
                title: 'Experience', value: doctor.experience ?? ''),
            buildDoctorInfo(
                title: 'Description', value: doctor.description ?? ''),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorInfo({required String title, required var value}) =>
      Padding(
        padding: EdgeInsets.only(bottom: 2.0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title: ',
              style: TextStyles.titleStyle18,
            ),
            Flexible(
              child: Text(
                '$value',
                style: TextStyles.titleStyle16.copyWith(
                    color: ColorManager.grey, fontWeight: FontWeight.normal),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      );
}
