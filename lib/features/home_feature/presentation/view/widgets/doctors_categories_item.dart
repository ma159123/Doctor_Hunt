import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';


class DoctorCategoriesItem extends StatelessWidget {
  const DoctorCategoriesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      padding:  EdgeInsets.only(left: 10,right: 10,top: 2.h),
      margin: const EdgeInsets.only(bottom: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey,
            blurRadius: 2,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image(
              image: const NetworkImage(
                  'https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),
              fit: BoxFit.cover,
              width: 25.w,
              height: 12.h,
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 1.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Dr. Fillerup Grab',
                  style: TextStyles.titleStyle18
                      .copyWith(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.5.h,),
                Text(
                  'Specialist Cardiologist ',
                  style: TextStyles.titleStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.lightGrey),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                  const RateWidget(rate: 5, numOfRates: 5),
                    SizedBox(width: 1.w,),
                    const Text('2.4',style: TextStyles.titleStyle18,),
                    Text('(2475 views)',style: TextStyles.titleStyle14.copyWith(color: ColorManager.lightGrey,fontWeight: FontWeight.w300),)
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
