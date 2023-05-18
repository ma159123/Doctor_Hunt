import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

void showSnackBar(
    {required BuildContext context,
    required String msg,
    required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: ColorManager.white),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
