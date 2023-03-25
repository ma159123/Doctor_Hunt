import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/doctors_categories_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/popular_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/text_styles.dart';

class PopularDoctorsView extends StatelessWidget {
  const PopularDoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 5.h,left: 5.w),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAppBar(title: '', onTap:(){
                        GoRouter.of(context).pop();
                      }),
                      Padding(
                        padding:  EdgeInsets.only(right: 5.0.w),
                        child: Icon(Icons.search,color: ColorManager.lightGrey,size: 30,),
                      ),
                    ],
                  ),
                  SizedBox(height:5.h),
                  const Text('Popular Doctor',style: TextStyles.titleStyle18,),
                  SizedBox(height: 2.h,),
                  const PopularDoctorsList(),
                  SizedBox(height: 3.h,),
                  const Text('Category',style: TextStyles.titleStyle18,),

                ],
              ),
            ),
            const SliverFillRemaining(
              child:  DoctorCategoriesList(),
            ),
          ],

        ),
      ),
    );
  }
}
