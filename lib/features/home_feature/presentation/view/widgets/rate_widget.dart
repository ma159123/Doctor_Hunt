import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({Key? key,required this.rate,required this.numOfRates})
      : super(key: key);

  final int rate;
  final int numOfRates;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      width: 25.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return  Icon(
            FontAwesomeIcons.solidStar,
            color: ColorManager.yellow,
            size: 14,
          );
        },
        separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 2.w,),
        itemCount: 5,
      ),
    );
  }
}
