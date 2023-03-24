import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/circle_widget.dart';

class SearchDoctorsItem extends StatelessWidget {
  const SearchDoctorsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      padding: const EdgeInsets.all(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
                  width: 30.w,
                  height: 13.h,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dr. Fillerup Grab',
                        style: TextStyles.titleStyle12
                            .copyWith(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    'Tooths Dentist',
                    style: TextStyles.titleStyle12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorManager.lightGreen),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    '7 Years experience ',
                    style: TextStyles.titleStyle12.copyWith(
                        fontWeight: FontWeight.w300,
                      color: ColorManager.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      const CircleWidget(),
                      SizedBox(width: 1.w,),
                      Text('74%',style: TextStyles.titleStyle10.copyWith(color: ColorManager.lightGrey,fontWeight: FontWeight.w300),),
                      SizedBox(width: 3.w,),
                      const CircleWidget(),
                      SizedBox(width: 1.w,),
                      Text('78 Patient Stories',style: TextStyles.titleStyle10.copyWith(color: ColorManager.lightGrey,fontWeight: FontWeight.w300),)
                  ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Available ',
                    style: TextStyles.titleStyle12
                        .copyWith(fontWeight: FontWeight.w500,color:ColorManager.green ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    '12:00 AM tomorrow',
                    style: TextStyles.titleStyle12
                        .copyWith(fontWeight: FontWeight.w500,color: ColorManager.grey ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              CustomButton(buttonText: 'Book Now', textColor: ColorManager.white,width: 30.w,height: 5.h,fontSize: 10.sp,)
            ],
          ),

        ],
      ),
    );
  }
}
