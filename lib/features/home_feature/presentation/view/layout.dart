import 'package:doctor_hunt/core/utils/color_manager.dart';
import 'package:doctor_hunt/features/home_feature/presentation/manager/layout_cubit.dart';
import 'package:doctor_hunt/features/home_feature/presentation/manager/layout_state.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/widgets/custom_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutState>(
        listener: (context,state){},
        builder: (context,state){
          var layoutCubit=LayoutCubit.get(context);
          return  Scaffold(
            body:layoutCubit.views[layoutCubit.index],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              child: BottomNavigationBar(
                onTap: (index){
                  layoutCubit.changeBottomNavBar(index);
                },
                backgroundColor: ColorManager.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: ColorManager.green,
                unselectedItemColor: ColorManager.lightGrey,

                items:  [
                  buildBottomNavBar(icon: Icons.home, isCurrentIndex: layoutCubit.index==0),
                  buildBottomNavBar(icon: Icons.favorite, isCurrentIndex: layoutCubit.index==1 ),
                  buildBottomNavBar(icon: Icons.menu_book, isCurrentIndex: layoutCubit.index==2 ),
                  buildBottomNavBar(icon: Icons.chat, isCurrentIndex: layoutCubit.index==3),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
