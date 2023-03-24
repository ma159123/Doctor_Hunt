import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/color_manager.dart';

BottomNavigationBarItem buildBottomNavBar(
    {required IconData icon,
      required bool isCurrentIndex,
      }) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:  6.h,
        width: 13.w,
        decoration: BoxDecoration(
          color:isCurrentIndex? ColorManager.green:Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 3.h,
            color:isCurrentIndex? Colors.white:ColorManager.grey,
          ),
        ),
      ),
    ),
    label: "",
  );
}