import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../utils/color_manager.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: 4.w,
      decoration: BoxDecoration(
        color: ColorManager.green,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
