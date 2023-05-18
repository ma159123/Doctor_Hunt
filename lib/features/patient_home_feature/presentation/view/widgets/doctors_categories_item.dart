import 'package:doctor_hunt/core/utils/app_routes.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_state.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/result.dart';

class DoctorCategoriesItem extends StatelessWidget {
  const DoctorCategoriesItem({Key? key, required this.doctor})
      : super(key: key);
  final Result doctor;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 18.h,
          padding: EdgeInsets.only(left: 10, right: 10, top: 1.h),
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRoutes.doctorDetailsViewRoute, extra: doctor);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image(
                        image: NetworkImage(doctor.image ??
                            'https://img.freepik.com/free-photo/attractive-young-male-nutriologist-lab-coat-smiling-against-white-background_662251-2960.jpg'),
                        fit: BoxFit.cover,
                        width: 25.w,
                        height: 12.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name ?? 'Dr. Fillerup Grab',
                          style: TextStyles.titleStyle18
                              .copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          doctor.jobTitle ?? 'Specialist Cardiologist ',
                          style: TextStyles.titleStyle14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorManager.lightGrey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            RateWidget(rate: 5, numOfRates: doctor.rating ?? 5),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '(${doctor.rating.toString()} views)',
                              style: TextStyles.titleStyle14.copyWith(
                                  color: ColorManager.lightGrey,
                                  fontWeight: FontWeight.w300),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (AuthCubit.get(context)
                            .userModelAsPatient!
                            .result!
                            .favoriteDoctors!
                            .contains(doctor.id)) {
                          AuthCubit.get(context)
                              .userModelAsPatient!
                              .result
                              ?.favoriteDoctors
                              ?.remove(doctor.id);
                        } else {
                          AuthCubit.get(context)
                              .userModelAsPatient!
                              .result
                              ?.favoriteDoctors
                              ?.add(doctor.id);
                        }
                        AuthCubit.get(context).updatePatient();
                        // LayoutCubit.get(context).getFavoritesDoctors(ids:  AuthCubit.get(context).userModelAsPatient?.result?.favoriteDoctors);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: AuthCubit.get(context)
                                .userModelAsPatient!
                                .result!
                                .favoriteDoctors!
                                .contains(doctor.id)
                            ? Colors.red
                            : Colors.grey,
                      )),
                ],
              ),
              Text(
                '\$${doctor.appointmentCost}' ,
                style: TextStyles.titleStyle20.copyWith(
                    color: ColorManager.green,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        );
      },
    );
  }
}
