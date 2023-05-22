import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/manager/auth_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_cubit.dart';
import 'package:doctor_hunt/features/book_feature/presentation/manager/book_state.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../book_feature/presentation/view/widgets/record_widget.dart';
import '../manager/layout_state.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({Key? key}) : super(key: key);

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  List<String> doctorsIds = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BookCubit.get(context)
        .getPatientAppointments(patientID: '644b02bdfd1538fe902af43c');


  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bookCubit = BookCubit.get(context);
        return Container(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Appointments',
                  style: TextStyles.titleStyle18,
                ),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: state is GetAppointmentsLoadingState ||
                        state is GetAppointmentsDoctorsLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.green,
                        ),
                      )
                    : BookCubit.get(context)
                            .patientAppointments
                            .results!
                            .isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: bookCubit
                                      .patientAppointments.results?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return RecordWidget(
                                  appointment: bookCubit
                                      .patientAppointments.results?[index],
                                  index: index,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: 2.h,
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'There are no Appointments!',
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
