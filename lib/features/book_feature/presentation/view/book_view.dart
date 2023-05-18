import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_state.dart';
import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/slot_item.dart';
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

class BookView extends StatefulWidget {
  const BookView({Key? key, required this.doctor}) : super(key: key);

  final Result doctor;

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  List<String> times = [];
  List<String> amTimes = [];

  // Filter the list of time strings for PM times
  List<String> pmTimes = [];
  String selectedTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BookCubit.get(context).getAvailableAppointmentsForDoctor(doctorID: widget.doctor.id!);
      convertTimeFormat(BookCubit.get(context).availableAppointments.results ?? []);

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                  DoctorCategoriesItem(
                    doctor: widget.doctor,
                  ),
                  Text('Afternoon ${amTimes.length} slots',
                      style: TextStyles.titleStyle18),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 1,
                        ),
                        itemCount: amTimes.length,
                        itemBuilder: (BuildContext context, int index)=>Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                          child: SlotItem(
                            isSelected: false,
                            time: amTimes[index],
                            onTap: () {
                              selectedTime = amTimes[index];
                              print(selectedTime);
                            },
                          ),
                        )
                        ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Evening ${pmTimes.length} slots',
                      style: TextStyles.titleStyle18),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 1,
                        ),
                        itemCount: pmTimes.length,
                        itemBuilder: (BuildContext context, int index)=>Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                          child: SlotItem(
                            isSelected: false,
                            time: pmTimes[index],
                            onTap: () {
                              selectedTime = pmTimes[index];
                            },
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomButton(
                    buttonText: 'Book Now',
                    textColor: ColorManager.white,
                    width: 50.w,
                    height: 5.h,
                    fontSize: 10.sp,
                    onTap: () {
                      DateFormat inputFormat = DateFormat('h:mm a');

                      DateTime dateTime = inputFormat.parse(selectedTime);
                      BookCubit.get(context).createAppointment(
                          date: dateTime,
                          doctorID: widget.doctor.id!,
                          patientID: AuthCubit.get(context).userModelAsPatient!.result!.id!,
                          state: 'waiting',
                          online: "false",
                          cost: widget.doctor.appointmentCost.toString()??'0',
                          notes: '',
                      );
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

  void convertTimeFormat(List<DateTime> dateTimes) {
    // Iterate over the input list and format each date and time string
    for (DateTime dateTime in dateTimes) {
      // Parse the date and time string into a DateTime object
      // Convert the DateTime object to the desired time zone (optional)
      dateTime = dateTime.toLocal();

      // Create a DateFormat object with the desired time format
      DateFormat timeFormat = DateFormat('h:mm a');

      // Format the DateTime object into the desired time format
      String time = timeFormat.format(dateTime);

      // Print the formatted time string
      times.add(time);
    }
    amTimes = times.where((time) => time.endsWith("AM")).toList();

    // Filter the list of time strings for PM times
    pmTimes = times.where((time) => time.endsWith("PM")).toList();

    print("AM times:");
    for (var time in amTimes) {
      print(time);
    }

    // Print the PM times
    print("PM times:");
    for (var time in pmTimes) {
      print(time);
    }
  }
}
