import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class FeatureDoctorsItem extends StatelessWidget {
  const FeatureDoctorsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      padding: const EdgeInsets.all(10),
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
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: ColorManager.grey,
              ),
              Spacer(),
              Icon(
                Icons.star,
                color: ColorManager.yellow,
              ),
              Text(
                ' 3.7',
                style: TextStyles.titleStyle12
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Dr. Fillerup Grab',
            style:
                TextStyles.titleStyle12.copyWith(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            '\$ 25.00/ hours',
            style:
                TextStyles.titleStyle12.copyWith(color: ColorManager.lightGrey),
          ),
        ],
      ),
    );
  }
}
