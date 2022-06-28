import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/pages/weather/weather_service.dart';

import '../../model/model.dart';

class WeatherController extends GetxController with StateMixin {
  final _weatherService = WeatherService.get();
  late Rx<Model> weatherModel;

  void callRefresh() async {
    await _refreshData();
  }

  @override
  void onInit() async {
    super.onInit();
    await _refreshData();
  }

  _refreshData() async {
    Timer t = Timer(const Duration(milliseconds: 200), () {
      change(null, status: RxStatus.loading());
    });
    try {
      weatherModel = (await _weatherService.getData()).obs;
      change(null, status: RxStatus.success());
      //ONLY FOR SHOWING THE SUCCESS OF THE UPDATE (thats why strings hardcoded here)
      Get.snackbar('Success', 'Data loaded successfully',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(Icons.check, color: Colors.white));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      t.cancel();
    }
  }
}
