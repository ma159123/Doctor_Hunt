import 'package:doctor_hunt/features/book_feature/presentation/view/widgets/record_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';

class AllRecordsView extends StatelessWidget {
  const AllRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> reports = [
      const RecordWidget(),
      const RecordWidget(),
      const RecordWidget(),
      const RecordWidget(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                  title: 'All Records',
                  onTap: () {
                    GoRouter.of(context).pop();
                  }),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: reports.length,
                  itemBuilder: (BuildContext context, int index) {
                    return reports[index];
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 2.h,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                width: 70.w,
                height: 6.h,
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.addRecordViewRoute);
                },
                buttonText: 'Upload record',
                textColor: Colors.white,
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
