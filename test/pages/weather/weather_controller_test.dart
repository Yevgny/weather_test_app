import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/model/model.dart';
import 'package:weather_test_app/pages/weather/weather_controller.dart';
import 'package:weather_test_app/pages/weather/weather_service.dart';

//tests for the WeatherController() class
void main() {
  Get.lazyPut(() => WeatherService());
  var wc = WeatherController();
  wc.onInit();
  test('WeatherController()', () {
    expect(wc, isA<WeatherController>());
  });
  //test WeatherController refreshes
  test('WeatherController.callRefresh()', () async {
    wc.weatherModel = Model(content: []).obs;
    wc.callRefresh();
    expect(wc.weatherModel.value, isA<Model>());
  });
}
