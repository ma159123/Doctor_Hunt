import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 0.5.h,
        width: 30.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
