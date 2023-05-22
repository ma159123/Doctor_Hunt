import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_patient_appointments/result.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({Key? key, required this.appointment, required this.index})
      : super(key: key);

  final Result? appointment;
  final int index;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  var formattedDate = '1 FEB';
  List<String> doctorsIds = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = formatDate(widget.appointment?.date.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 18.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, -3), // negative offset for top shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 20.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: ColorManager.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  '$formattedDate',
                  style: TextStyles.titleStyle18
                      .copyWith(color: ColorManager.white),
                  textAlign: TextAlign.center,
                )),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 20.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: ColorManager.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  '${widget.appointment?.state}',
                  style: TextStyles.titleStyle16
                      .copyWith(color: ColorManager.green),
                  textAlign: TextAlign.center,
                )),
              ),
            ],
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Records added by you',
                  style: TextStyles.titleStyle16),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                  'Record for ${widget.appointment?.doctor?.name}',
                  style: TextStyles.titleStyle14
                      .copyWith(color: ColorManager.green)),
              SizedBox(
                height: 1.h,
              ),
              Text('1 Prescription',
                  style: TextStyles.titleStyle14
                      .copyWith(color: ColorManager.lightGrey)),
            ],
          ),
          // SizedBox(
          //   width: 3.w,
          // ),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)))
        ],
      ),
    );
  }

  String formatDate(String datetimeString) {
    final parsedDateTime = DateTime.parse(datetimeString);
    final formatter = DateFormat('dd MMM');
    return formatter.format(parsedDateTime);
  }
}
