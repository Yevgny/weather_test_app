import 'package:get/get.dart';
import 'package:weather_test_app/pages/weather/weather_service.dart';

abstract class AppServices {
  static Future<void> init() async {
    Get.lazyPut(() => WeatherService());
    _initRepositories();
  }

  static void _initRepositories() {
    /// if we need repositories, register here.
    //Get.lazyPut(() => WeatherRepo());
  }
}
