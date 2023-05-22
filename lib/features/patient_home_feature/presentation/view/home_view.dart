import 'dart:io';
import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_state.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/doctors_categories_list.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/medical_specialties_list.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/routes_manager.dart';
import '../manager/layout_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var authCubit = AuthCubit.get(context);
    var layoutCubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
                          height: 20.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                ColorManager.darkGreen,
                                ColorManager.lightGreen
                              ],
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
                                    'Hi ${authCubit.userModelAsPatient?.result?.name ?? 'there!'}',
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
                                child: GestureDetector(
                                  onTap: () {
                                    print(layoutCubit.doctorsModel.message);
                                    Navigator.pushNamed(context,AppRoutes.profileViewRoute,
                                        arguments: authCubit.userModelAsPatient);
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: authCubit
                                                .userModelAsPatient
                                                ?.result
                                                ?.image !=
                                            null
                                        ? FileImage(File(
                                            '${authCubit.userModelAsPatient?.result?.image}'))
                                        : const NetworkImage('')
                                            as ImageProvider<Object>?,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.0.h),
                          child: GestureDetector(
                            onTap: () {},
                            child: SearchTextField(
                              textEditingController: searchController,
                              hintText: 'Search..... ',
                              validation: (val) {},
                              onTap: () {
                                print('object');
                                Navigator.pushNamed(context,AppRoutes.searchViewRoute);
                              },
                              isReadOnly: true,
                              onSearch: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    state is GetAllCategoriesLoadingState
                        ? CircularProgressIndicator(
                            color: ColorManager.green,
                          )
                        : MedicalSpecialtiesList(
                            categoriesModel: layoutCubit.categoriesModel,
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Popular Doctor',
                            style: TextStyles.titleStyle18,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,AppRoutes.popularDoctorsViewRoute);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'see all',
                                  style: TextStyles.titleStyle14
                                      .copyWith(color: ColorManager.lightGrey),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorManager.lightGrey,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              state is GetAllDoctorsLoadingState ||
                      state is GetDoctorsByCategoryLoadingState
                  ? SliverFillRemaining(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0.h),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.green,
                          ),
                        ),
                      ),
                    )
                  : SliverFillRemaining(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0.w, right: 5.w),
                        child: DoctorCategoriesList(
                          doctor: layoutCubit.doctorsModel,
                          isScrolled: false,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
