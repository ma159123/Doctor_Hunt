import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/doctors_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../manager/layout_cubit.dart';

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var layoutCubit = LayoutCubit.get(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 5.h, left: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppBar(
                    title: '',
                   ),
                Padding(
                  padding: EdgeInsets.only(right: 5.0.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context,AppRoutes.searchViewRoute);
                    },
                    icon: Icon(
                      Icons.search,
                      color: ColorManager.lightGrey,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            const Text(
              'Popular Doctor',
              style: TextStyles.titleStyle18,
            ),
            Expanded(
              child: DoctorCategoriesList(
                isScrolled: true,
                doctor: layoutCubit.doctorsModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
