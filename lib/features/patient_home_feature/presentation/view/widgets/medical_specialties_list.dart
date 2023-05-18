
import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/categories_model/categories_model.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/categories_model/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/specialization_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MedicalSpecialtiesList extends StatefulWidget {
  const MedicalSpecialtiesList({Key? key, required this.categoriesModel})
      : super(key: key);

  final CategoriesModel categoriesModel;

  @override
  State<MedicalSpecialtiesList> createState() => _MedicalSpecialtiesListState();
}

class _MedicalSpecialtiesListState extends State<MedicalSpecialtiesList> {
  List<Color> colors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // generateRandomColors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      height: 20.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return medicalSpecialtiesItem(
              category: widget.categoriesModel.results![index],
              context: context,
              color: ColorManager.categoryColor);
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 5.w,
        ),
        itemCount: widget.categoriesModel.results!.length,
      ),
    );
  }

  // void generateRandomColors() {
  //   for (int i = 0; i < widget.categoriesModel.results!.length; i++) {
  //     final random = Random();
  //     final color = Color.fromRGBO(
  //       random.nextInt(256),
  //       random.nextInt(256),
  //       random.nextInt(256),
  //       1.0,
  //     );
  //     colors.add(color);
  //   }
  // }

  Widget medicalSpecialtiesItem(
      {required Result category, required BuildContext context, Color? color}) {
    return GestureDetector(
      onTap: () {
        LayoutCubit.get(context).getDoctorsByCategory(categoryId: category.id!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecializationView(
                specialization: category.name ?? 'Specialization',
                specializationDoctors:
                    LayoutCubit.get(context).specificDoctorsModel),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 15.h,
            width: 25.w,
            decoration: BoxDecoration(
              color: color ?? ColorManager.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: Center(
              child: Text(
                '${category.name}',
                textAlign: TextAlign.center,
                style:
                    TextStyles.titleStyle16.copyWith(color: ColorManager.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
