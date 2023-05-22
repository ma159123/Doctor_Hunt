import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_state.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/favorite_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/text_styles.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutCubit.get(context).getFavoritesDoctors(
        ids:
            AuthCubit.get(context).userModelAsPatient?.result?.favoriteDoctors);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Favourite Doctors',
                  style: TextStyles.titleStyle18,
                ),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: state is GetFavoriteDoctorsLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.green,
                        ),
                      )
                    : LayoutCubit.get(context).favoriteDoctorsList.isNotEmpty
                        ? FavoriteDoctorsList(
                            doctors:
                                LayoutCubit.get(context).favoriteDoctorsList,
                          )
                        : const Center(
                            child: Text(
                              'There are no doctors found!',
                              style: TextStyles.titleStyle16,
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
