import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_state.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/search_doctors_list.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var layoutCubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Find Doctors',

                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SearchTextField(
                    textEditingController: searchController,
                    hintText: 'Search',
                    validation: (val) {},
                    isReadOnly: false,
                    autofocus: true,
                    onChange: (value) {
                      if (value == '') {
                        layoutCubit.clearSearchResults();
                      } else {
                        layoutCubit.searchDoctors(name: searchController.text);
                      }
                    },
                    onSearch: () {
                      //layoutCubit.searchDoctors(name: searchController.text);
                    },
                    onClear: () {
                      layoutCubit.clearSearchResults();
                      searchController.clear();
                    },
                  ),
                  Expanded(
                      child: state is SearchDoctorsLoadingState
                          ? Center(
                              child: CircularProgressIndicator(
                              color: ColorManager.green,
                            ))
                          : SearchDoctorsList(
                              searchDoctorsResult:
                                  layoutCubit.searchDoctorsModel,
                            )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
