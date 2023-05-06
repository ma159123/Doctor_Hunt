import 'package:doctor_hunt/features/home_feature/data/models/doctors_model/doctors_model.dart';
import 'package:doctor_hunt/features/home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/doctors_categories_item.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/slot_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Widget> slots = [
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
      SlotItem(
        isSelected: false,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                  title: 'Select Time',
                  onTap: () {
                    GoRouter.of(context).pop();
                  }),
              SizedBox(
                height: 2.h,
              ),
              const DoctorCategoriesItem(
                doctor: Result(),
              ),
              const Text('Afternoon 7 slots', style: TextStyles.titleStyle18),
              SizedBox(
                height: 2.h,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  slots.length,
                  (index) => slots[index],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text('Evening 5 slots', style: TextStyles.titleStyle18),
              SizedBox(
                height: 2.h,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  slots.length,
                  (index) => slots[index],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                buttonText: 'Book Now',
                textColor: ColorManager.white,
                width: 30.w,
                height: 5.h,
                fontSize: 10.sp,
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.medicalRecordsViewRoute);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
