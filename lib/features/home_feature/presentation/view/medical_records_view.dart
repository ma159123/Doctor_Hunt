import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 2.0.h, right: 5.w, left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                  title: 'Medical Records',
                  onTap: () {
                    GoRouter.of(context).pop();
                  }),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 15.h,
                  backgroundColor: ColorManager.green.withOpacity(0.2),
                  child: SvgPicture.asset(
                    'assets/images/add-record.svg',
                    semanticsLabel: 'My SVG Image',
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Add a medical record.',
                style: TextStyles.titleStyle25
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'A detailed health history helps a doctor diagnose you better.',
                textAlign: TextAlign.center,
                style: TextStyles.titleStyle14
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                width: 70.w,
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.addRecordViewRoute);
                },
                buttonText: 'Add a record',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
