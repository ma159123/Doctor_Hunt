import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/home_feature/data/models/categories_model/categories_model.dart';
import 'package:doctor_hunt/features/home_feature/data/models/categories_model/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MedicalSpecialtiesList extends StatelessWidget {
  const MedicalSpecialtiesList({Key? key, required this.categoriesModel})
      : super(key: key);

  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      height: 20.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            medicalSpecialtiesItem(category: categoriesModel.results![index]),
        separatorBuilder: (context, index) => SizedBox(
          width: 5.w,
        ),
        itemCount: 4,
      ),
    );
  }

  Widget medicalSpecialtiesItem({required Result category}) {
    return Column(
      children: [
        Container(
            height: 15.h,
            width: 25.w,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: const Icon(
              Icons.remove_red_eye_outlined,
              size: 50,
              color: Colors.white,
            )),
        Text(
          '${category.name}',
          style: TextStyles.titleStyle14,
        ),
      ],
    );
  }
}
