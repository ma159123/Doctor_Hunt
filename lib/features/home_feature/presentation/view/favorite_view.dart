import 'package:doctor_hunt/features/home_feature/data/models/doctors_model/doctors_model.dart';
import 'package:doctor_hunt/features/home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/doctors_categories_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
              title: 'Favourite Doctors',
              onTap: () {
                GoRouter.of(context).pop();
              }),
          SizedBox(height: 5.h),
          SearchTextField(
            textEditingController: searchController,
            hintText: 'Enter speciality',
            validation: (val) {},
            isReadOnly: false,
            onSearch: () {},
          ),
          SizedBox(
            height: 3.h,
          ),
          const Text(
            'Results',
            style: TextStyles.titleStyle18,
          ),
          const Expanded(
              child: DoctorCategoriesList(
            isScrolled: true,
            doctor: DoctorsModel(),
          )),
        ],
      ),
    );
  }
}
