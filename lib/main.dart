import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/const/strings.dart';
import 'package:weather_test_app/routes.dart';
import 'package:weather_test_app/services.dart';

void main() async {
  await AppServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      locale: AppStrings.locale,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
