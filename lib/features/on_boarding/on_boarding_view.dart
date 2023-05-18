import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/app_routes.dart';
import '../../core/widgets/custom_button.dart';
import 'model/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: modeList.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(top: 15.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(modeList[i].image),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        modeList[i].title,
                        style: TextStyles.titleStyle25
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          modeList[i].subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyles.titleStyle14
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          CustomButton(
            onTap: () {
              if (currentIndex == modeList.length - 1) {
                GoRouter.of(context).pushReplacement(AppRoutes.loginViewRoute);
              }
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            buttonText:
                currentIndex == modeList.length - 1 ? 'Get Started' : 'Next',
            textColor: Colors.white,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.loginViewRoute);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 7.h, top: 2.h),
              child: Text(
                'Skip',
                style:
                    TextStyles.titleStyle14.copyWith(color: ColorManager.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
