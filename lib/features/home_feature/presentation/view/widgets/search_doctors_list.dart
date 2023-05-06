import 'package:doctor_hunt/features/home_feature/data/models/doctors_model/doctors_model.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/book_view.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/search_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchDoctorsList extends StatelessWidget {
  const SearchDoctorsList({Key? key, required this.searchDoctorsResult})
      : super(key: key);

  final DoctorsModel searchDoctorsResult;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => SearchDoctorsItem(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookView()));
                },
                doctorItem: searchDoctorsResult.results![index],
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: searchDoctorsResult.results?.length ?? 0),
    );
  }
}
