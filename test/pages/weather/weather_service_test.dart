import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/model/model.dart';
import 'package:weather_test_app/pages/weather/weather_service.dart';

void main() async {
  Get.lazyPut(() => WeatherService());
  var ws = WeatherService.get();
  test('WeatherService.get()', () async {
    expect(ws, isA<WeatherService>());
  });
  //test service returns a Model obj
  test('WeatherService.getData()', () async {
    var data = await ws.getData();
    expect(data, isA<Model>());
  });
}
