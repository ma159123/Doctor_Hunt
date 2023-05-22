import 'package:doctor_hunt/core/widgets/custom_loading_indecator.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_state.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/slot_item.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/slots_list.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/doctors_model/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/view/widgets/doctors_categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_snackbar.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key, required this.doctor}) : super(key: key);

  final Result doctor;

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  String? selectedTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BookCubit.get(context)
        .getAvailableAppointmentsForDoctor(doctorID: widget.doctor.id!);
  }

  @override
  Widget build(BuildContext context) {
    var bookCubit = BookCubit.get(context);
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is CreateAppointmentErrorState) {
          showSnackBar(
              context: context,
              msg: state.error,
              backgroundColor: ColorManager.error);
        } else if (state is CreateAppointmentSuccessState) {
          if (state.appointmentModel.success == true) {
            showSnackBar(
                context: context,
                msg: state.appointmentModel.message! ?? 'Booked Successfully',
                backgroundColor: ColorManager.green);
          } else {
            showSnackBar(
                context: context,
                msg: state.appointmentModel.message! ?? 'Booked Successfully',
                backgroundColor: ColorManager.error);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding:
                  EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                      title: 'Select Time',
                   ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DoctorCategoriesItem(
                    doctor: widget.doctor,
                  ),
                  state is GetAvailableAppointmentsLoadingState
                      ? Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: const CustomLoadingIndicator(),
                        )
                      : Column(
                          children: [
                            SlotList(
                              slots: bookCubit.amTimes,
                              type: 'Afternoon',
                              selectedTime: (selectedTime) {
                                this.selectedTime = selectedTime;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SlotList(
                              slots: bookCubit.pmTimes,
                              type: 'Evening',
                              selectedTime: (selectedTime) {
                                this.selectedTime = selectedTime;
                              },
                            ),
                          ],
                        ),
                  const Spacer(),
                  state is CreateAppointmentLoadingState
                      ? const CustomLoadingIndicator()
                      : CustomButton(
                          buttonText: 'Book Now',
                          textColor: ColorManager.white,
                          width: 50.w,
                          height: 5.h,
                          fontSize: 10.sp,
                          onTap: () {
                            if ((bookCubit.amTimes.isNotEmpty ||
                                    bookCubit.pmTimes.isNotEmpty) &&
                                selectedTime != null) {
                              String? selectedTimeWithOriginFormat = bookCubit
                                  .convertTimeToDateTimeString(selectedTime);
                              print(selectedTimeWithOriginFormat);
                              BookCubit.get(context).createAppointment(
                                date: selectedTimeWithOriginFormat,
                                doctorID: widget.doctor.id!,
                                patientID: AuthCubit.get(context)
                                    .userModelAsPatient!
                                    .result!
                                    .id!,
                                state: 'waiting',
                                online: "false",
                                cost:
                                    widget.doctor.appointmentCost.toString() ??
                                        '110',
                                notes: '',
                              );
                            } else {
                              showSnackBar(
                                  context: context,
                                  msg: 'Please, be sure to select a time',
                                  backgroundColor: ColorManager.error);
                            }

                            //   GoRouter.of(context).push(AppRoutes.medicalRecordsViewRoute);
                          },
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
