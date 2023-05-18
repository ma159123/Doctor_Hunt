import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class PopularDoctorsItem extends StatelessWidget {
  const PopularDoctorsItem({Key? key, required this.doctor}) : super(key: key);
  final Result doctor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 50.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 18.h,
            width: 50.w,
            image: NetworkImage(doctor.image ??
                'https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            doctor.name ?? 'Dr. Fillerup Grab',
            style: TextStyles.titleStyle18,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            doctor.jobTitle ?? 'Medicine Specialist',
            style:
                TextStyles.titleStyle12.copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 1.h,
          ),
          RateWidget(rate: doctor.rating!, numOfRates: doctor.rating!),
        ],
      ),
    );
  }
}
