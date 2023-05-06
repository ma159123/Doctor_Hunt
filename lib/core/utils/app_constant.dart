import 'package:flutter/cupertino.dart';

class AppConstants {
  static int currentPage = 0;
  static PageController pageController = PageController();
  static String BASE_URL = 'http://206.81.19.12:6060';
  static String GET_DOCTOR_URL = '$BASE_URL/api/doctor';
}
