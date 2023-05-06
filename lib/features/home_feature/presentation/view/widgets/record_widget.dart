import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 18.h,
      padding: EdgeInsets.all(10),
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
                  '27\n FEB',
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
                  'NEW',
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
              Text('Records added by you', style: TextStyles.titleStyle16),
              SizedBox(
                height: 1.5.h,
              ),
              Text('Record for Abdullah mamun',
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
          SizedBox(
            width: 3.w,
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)))
        ],
      ),
    );
  }
}
