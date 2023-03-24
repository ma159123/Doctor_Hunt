class DataBoardingModel {
  late String title, subTitle, image;

  DataBoardingModel(
      {required this.title, required this.subTitle, required this.image});
}

List<DataBoardingModel> modeList = [
  DataBoardingModel(
      title: 'Find Trusted Doctors',
      image: 'assets/images/onboarding1.png',
      subTitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'),
  DataBoardingModel(
      title: 'Choose Best Doctors',
      image: 'assets/images/onboarding2.png',
      subTitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'),
  DataBoardingModel(
      title: 'Easy Appointments',
      image: 'assets/images/onboarding3.png',
      subTitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'),
];
