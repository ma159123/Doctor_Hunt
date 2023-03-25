import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_doctors_list.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController=TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w),
          child:Column(
            children:  [
              CustomAppBar(title: 'Find Doctors', onTap: () {
                GoRouter.of(context).pop();
              },),
              SizedBox(height: 3.h,),
              SearchTextField(
                textEditingController: searchController,
                hintText: 'Enter speciality',
                validation: (val){}, isReadOnly: false,
              ),
              const Expanded(child: SearchDoctorsList()),
            ],
          ),
        ),
      ),
    );
  }
}
