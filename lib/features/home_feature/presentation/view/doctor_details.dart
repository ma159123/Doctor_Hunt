import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/doctor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../auth_feature/presentation/views/widgets/current_cases_per_doc.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({Key? key}) : super(key: key);

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
                onTap: () {
                  GoRouter.of(context).pop();
                }),
            SizedBox(height: 5.h),
            const DoctorInfoWidget(),
            const CurrentDoctorCases(),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              'Services',
              style: TextStyles.titleStyle18,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 4.h,
                    child: Row(
                      children: [
                        Text(
                          '$index. ',
                          style: TextStyles.titleStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.green),
                        ),
                        Text(
                          'yjyrmryfbxfhtmuusfbghdhjyjyrmryfbxfhtmuu',
                          style: TextStyles.titleStyle14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorManager.lightGrey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
