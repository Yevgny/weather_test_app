import 'package:get/get.dart';
import 'package:weather_test_app/pages/weather/weather_controller.dart';

import 'pages/weather/weather_view.dart';

abstract class Routes {
  static const WEATHER = '/weather';
}

abstract class AppPages {
  static String initial = Routes.WEATHER;

  static final routes = [
    GetPage(
      name: Routes.WEATHER,
      page: () => WeatherView(),
      binding: BindingsBuilder.put(() => WeatherController()),
    ),
  ];
}
