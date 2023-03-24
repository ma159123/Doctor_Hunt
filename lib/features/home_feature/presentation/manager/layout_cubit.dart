import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/book_view.dart';
import '../view/chat_view.dart';
import '../view/favorite_view.dart';
import '../view/home_view.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState>{
 LayoutCubit(): super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget>views=const[
    HomeView(),
    FavoriteView(),
    BookView(),
    ChatView(),
  ];
  int index=0;
  void changeBottomNavBar(int index){
    this.index=index;
    emit(ChangeBottomNav());
  }
}