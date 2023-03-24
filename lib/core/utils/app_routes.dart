import 'package:doctor_hunt/features/auth_feature/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/auth_feature/presentation/views/register_view.dart';
import 'package:doctor_hunt/features/home_feature/presentation/view/layout.dart';
import 'package:doctor_hunt/features/on_boarding/on_boarding_view.dart';
import 'package:flutter/cupertino.dart';
import '../../features/home_feature/presentation/view/home_view.dart';
import '../../features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String layoutViewRoute='/layoutView';
  static String homeViewRoute = '/homeView';
  static String bookDetailsViewRoute = '/bookDetailsView';
  static String searchViewRoute = '/searchView';
  static String loginViewRoute = '/loginView';
  static String registerViewRoute = '/registerView';
  static String onBoardingViewRoute='/onBoardingView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: loginViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: registerViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: onBoardingViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return  OnBoardingView();
        },
      ),
      GoRoute(
        path: layoutViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const LayoutView();
        },
      ),
      GoRoute(
        path: homeViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      // GoRoute(
      //   name:bookDetailsViewRoute ,
      //   path: bookDetailsViewRoute,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //       create: (BuildContext context) =>
      //           SimilarBooksCubit(GetIt.instance.get<HomeRepoImpl>()),
      //       child:  BookDetailsView(bookModelItem: state.extra as Item,),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: searchViewRoute,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SearchView(
      //       bookModel: BookModel(),
      //     );
      //   },
      // ),
    ],
  );
}
