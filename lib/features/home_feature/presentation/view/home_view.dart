import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/feature_doctors_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/medical_specialties_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/popular_doctors_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController=TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
                    height: 20.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [ColorManager.darkGreen, ColorManager.lightGreen],
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Handwerker! ',
                              style: TextStyles.titleStyle20
                                  .copyWith(color: ColorManager.white),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Find Your Doctor ',
                              style: TextStyles.titleStyle25
                                  .copyWith(color: ColorManager.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0.h),
                          child:  const CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage('https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 16.0.h),
                    child: SearchTextField(
                        textEditingController: searchController,
                        hintText: 'Search..... ',
                        validation: (val){},
                      prefixIcon: Icon(Icons.search,color: ColorManager.grey,size: 25,),
                      suffixIcon: Icon(Icons.close,color: ColorManager.grey,size: 25,),
                        ),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              const MedicalSpecialtiesList(),
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular Doctor',style: TextStyles.titleStyle18,),
                    Row(
                      children: [
                        Text('see all',style: TextStyles.titleStyle14.copyWith(color: ColorManager.lightGrey),),
                        Icon(Icons.arrow_forward_ios,color: ColorManager.lightGrey,size: 15,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              const PopularDoctorsList(),
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Feature Doctor',style: TextStyles.titleStyle18,),
                    Row(
                      children: [
                        Text('see all',style: TextStyles.titleStyle14.copyWith(color: ColorManager.lightGrey),),
                        Icon(Icons.arrow_forward_ios,color: ColorManager.lightGrey,size: 15,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              const FeatureDoctorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
