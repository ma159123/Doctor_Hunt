import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/utils/app_constant.dart';
import 'package:doctor_hunt/features/patient_home_feature/data/models/categories_model/categories_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/network_info.dart';

class GetCategoriesRepository {
  late final NetworkInfo networkInfo;

  Future<Either<Failure, CategoriesModel>> getAllCategories() async {
    // if(await networkInfo.isConnected){
    try {
      final response = await http
          .get(Uri.parse('${AppConstants.BASE_URL}/api/category'), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjQ2MTQxZGM0MWY5NjJlMDYzYWQ1NWUwIiwiaWF0IjoxNjg0MDk1NDUyLCJleHAiOjE3MTU2MzE0NTJ9.uj2wAgKCFabJf-GRWOLF4ZtZ1xtZ4XtP9LGpciA6uvQ'
      });
      final data = jsonDecode(response.body);
      print('get category(repo) success:${response.body}}');
      return Right(CategoriesModel.fromJson(data));
    } on ServerException {
      print('get doctors(repo) error:mmmmm}');
      return Left(ServerFailure());
    }
    // }
    // else{
    //   return Left(OfflineFailure());
    // }
  }
}
