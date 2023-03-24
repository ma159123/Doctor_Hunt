// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
//
// import 'api_services.dart';
//
// final getIt = GetIt.instance;
//
// void setupLocator() {
//   getIt.registerSingleton<ApiServices>(
//     ApiServices(
//       dio: Dio(),
//     ),
//   );
//   getIt.registerSingleton<HomeRepoImpl>(
//     HomeRepoImpl(
//       getIt.get<ApiServices>(),
//     ),
//   );
// }
