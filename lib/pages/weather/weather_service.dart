import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/env.dart';

import '../../model/model.dart';

class WeatherService extends GetxService {
  final _dio = Dio();
  static WeatherService get() => Get.find();
  //get all regions for the Model.RegionDetails
  Future<Model> getData() async {
    try {
      var response = await _dio.get(envApiLink);
      //await Future.delayed(Duration(seconds: 1));
      return Model.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
