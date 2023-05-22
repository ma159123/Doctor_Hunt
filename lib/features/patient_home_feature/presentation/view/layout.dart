import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_cubit.dart';
import 'package:doctor_hunt/features/patient_home_feature/presentation/manager/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        return Scaffold(
          body: layoutCubit.views[layoutCubit.index],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: BottomNavigationBar(
              onTap: (index) {
                layoutCubit.changeBottomNavBar(index);
              },
              backgroundColor: ColorManager.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManager.green,
              unselectedItemColor: ColorManager.lightGrey,
              currentIndex: layoutCubit.index,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Saved'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.my_library_books_rounded),
                    label: 'Appointments'),
              ],
            ),
          ),
        );
      },
    );
  }
}
